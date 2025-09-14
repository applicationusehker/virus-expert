import React, { useMemo, useState, useEffect, useRef } from "react";
import {
  Activity,
  AlertTriangle,
  ClipboardList,
  ShieldCheck,
  Stethoscope,
  Info,
  User,
  ExternalLink,
  ChartColumn,
} from "lucide-react";
import SWIPL from "swipl-wasm";
import { createPortal } from "react-dom";
import variablePng from "./assets/variable.png";

/**
 * Virus Triage Expert System — Single-file React component
 * -------------------------------------------------------
 * • UI/UX: clean, grid-based layout using Tailwind classes
 * • Inputs: Bio data, Exposure history, Symptoms & onset date
 * • Engine: Prolog Bayesian model
 * • Output: Probability, action guidance, and rule breakdown

 */

// --- Domain Knowledge (from the scenario) -----------------------------------
const COMMON_SYMPTOMS = [
  { key: "fever", label: "Fever" },
  { key: "dryCough", label: "Persistent dry cough" },
  { key: "tiredness", label: "Tiredness / fatigue" },
];

const LESS_COMMON_SYMPTOMS = [
  { key: "aches", label: "Aches and pains" },
  { key: "soreThroat", label: "Sore throat" },
  { key: "diarrhea", label: "Diarrhoea" },
  { key: "conjunctivitis", label: "Conjunctivitis" },
  { key: "headache", label: "Headache" },
  { key: "anosmia", label: "Loss/reduction of smell or taste (anosmia/hyposmia)" },
  { key: "runnyNose", label: "Runny nose" },
];

const SERIOUS_SYMPTOMS = [
  { key: "breathing", label: "Difficulty breathing / shortness of breath" },
  { key: "chestPain", label: "Chest pain or pressure" },
  { key: "lossSpeech", label: "Loss of speech or movement" },
];

const COMORBIDITIES = [
  { key: "hypertension", label: "Hypertension" },
  { key: "diabetes", label: "Diabetes" },
  { key: "cardiovascular", label: "Cardiovascular disease" },
  { key: "respiratory", label: "Chronic respiratory disease" },
  { key: "cancer", label: "Cancer" },
  { key: "unknown", label: "Not Available" },
  { key: "none", label: "None" },
];

const SurfaceType = {
  PLASTIC_STEEL: "plastic_steel",
  COPPER_CARDBOARD: "copper_cardboard",
};

function clamp(n, min, max) {
  return Math.max(min, Math.min(max, n ?? 0));
}

function Section({ icon: Icon, title, subtitle, children }) {
  return (
    <section className="bg-white/80 backdrop-blur rounded-2xl shadow-sm border border-slate-200 p-5">
      <header className="flex items-start gap-3 mb-4">
        <div className="p-2 rounded-xl bg-slate-100"><Icon className="w-5 h-5" /></div>
        <div>
          <h2 className="text-lg text-left font-semibold leading-tight">{title}</h2>
          {subtitle && <p className="text-slate-600 text-sm text-left">{subtitle}</p>}
        </div>
      </header>
      <div>{children}</div>
    </section>
  );
}

function OutputSection({ icon: Icon, title, subtitle, children }) {
  return (
    <section className="bg-neutral-700 backdrop-blur rounded-2xl shadow-sm border border-slate-200 p-5">
      <header className="flex items-start gap-3 mb-4">
        <div className="p-2 rounded-xl bg-slate-100"><Icon className="w-5 h-5" /></div>
        <div>
          <h2 className="text-lg text-left font-semibold leading-tight text-white">{title}</h2>
          {subtitle && <p className="text-white text-sm text-left">{subtitle}</p>}
        </div>
      </header>
      <div>{children}</div>
    </section>
  );
}

function Labeled({ label, hint, children }) {
  return (
    <fieldset className="block mb-3 text-left">
      <legend className="flex items-center gap-2 mb-1">
        <span className="text-sm font-medium text-slate-700">{label}</span>
        {hint && <span className="text-[11px] text-slate-500">{hint}</span>}
      </legend>
      {children}
    </fieldset>
  );
}

function Checkbox({ checked, onChange, label, id }) {
  return (
    <div className="flex items-center gap-2">
      <input
        id={id}
        type="checkbox"
        className="w-4 h-4 rounded border-slate-300"
        checked={checked}
        onChange={(e) => onChange(e.target.checked)}
      />
      <label htmlFor={id} className="text-sm text-slate-800 select-none cursor-pointer">
        {label}
      </label>
    </div>
  );
}

function NumberInput({ value, onChange, min = 0, max = 999, step = 1, placeholder }) {
  return (
    <input
      type="number"
      min={min}
      max={max}
      step={step}
      value={value}
      onChange={(e) => onChange(e.target.value === "" ? "" : Number(e.target.value))}
      placeholder={placeholder}
      className="w-28 px-3 py-2 text-sm rounded-lg border border-slate-300 focus:outline-none focus:ring-2 focus:ring-slate-400"
    />
  );
}

function Pills({ items = [], onToggle, state }) {
  return (
    <div className="flex flex-wrap gap-2">
      {items.map((s) => {
        const active = !!state[s.key];
        return (
          <button
            key={s.key}
            onClick={() => onToggle(s.key, !active)}
            className={
              "px-3 py-1.5 rounded-full text-sm border transition " +
              (active
                ? "bg-slate-900 text-white border-slate-900"
                : "bg-white text-slate-800 border-slate-300 hover:border-slate-400")
            }
          >
            {s.label}
          </button>
        );
      })}
    </div>
  );
}

function Progress({ value, max }) {
  const pct = clamp((value / max) * 100, 0, 100);
  return (
    <div className="w-full h-3 bg-slate-100 rounded-full overflow-hidden">
      <div
        className="h-full bg-slate-900 transition-all"
        style={{ width: `${pct}%` }}
        aria-valuemin={0}
        aria-valuemax={max}
        aria-valuenow={value}
      />
    </div>
  );
}

// --- Main Component ----------------------------------------------------------
export default function VirusTriageExpertSystem() {
  // Bio
  const [ageAbove70, setAgeAbove70] = useState("unknown"); // "true" | "false" | "unknown"
  const [sex, setSex] = useState("unknown"); // "male" | "female" | "other" | "unknown"
  const [comorb, setComorb] = useState({unknown: true});

  // Exposure
  const [closeContact, setCloseContact] = useState("unknown"); // "true" | "false" | "unknown"
  const [closeContactDays, setCloseContactDays] = useState(3);

  const [crowdedIndoor, setCrowdedIndoor] = useState("unknown"); // "true" | "false" | "unknown"
  const [crowdedDays, setCrowdedDays] = useState(5);

  const [travelVirusville, setTravelVirusville] = useState("unknown"); // "true" | "false" | "unknown"
  const [travelDays, setTravelDays] = useState(10);

  const [surfaceExposure, setSurfaceExposure] = useState(false);
  const [surfaceType, setSurfaceType] = useState(SurfaceType.PLASTIC_STEEL);
  const [surfacePlasticSteel, setSurfacePlasticSteel] = useState("unknown"); // "true" | "false" | "unknown"
  const [surfaceCopperCardboard, setSurfaceCopperCardboard] = useState("unknown"); // "true" | "false" | "unknown"

  const [surfaceHours, setSurfaceHours] = useState(12);

  // Symptoms
  const [knownSymptoms, setKnownSymptoms] = useState("unknown"); // "true" | "false" | "unknown"
  const [onsetDate, setOnsetDate] = useState("");
  const [common, setCommon] = useState({});
  const [lessCommon, setLessCommon] = useState({});
  const [serious, setSerious] = useState({});

  const [evaluated, setEvaluated] = useState(false);

  const comorbidityCount = useMemo(
    () => COMORBIDITIES.reduce((n, c) => n + (comorb[c.key] ? (c.key !=="none"? 1: 0) : 0), 0),
    [comorb]
  );

  const commonCount = useMemo(
    () => COMMON_SYMPTOMS.reduce((n, s) => n + (common[s.key] ? 1 : 0), 0),
    [common]
  );
  const lessCommonCount = useMemo(
    () => LESS_COMMON_SYMPTOMS.reduce((n, s) => n + (lessCommon[s.key] ? 1 : 0), 0),
    [lessCommon]
  );
  const seriousCount = useMemo(
    () => SERIOUS_SYMPTOMS.reduce((n, s) => n + (serious[s.key] ? 1 : 0), 0),
    [serious]
  );

  // Pre-existing condition "unknown" logic
  useMemo(() => {
    // If "unknown" is set, clear all other comorbidities
    if (!comorb.unknown) return;
    // Only set if not already exactly { unknown: true }
    setComorb(prev => ({hypertension: false, diabetes: false, cardiovascular: false, respiratory: false, cancer: false, unknown: true, none: false}));
  }, [comorb.unknown]);

  useMemo(() => {
    // If any other comorbidity is set, clear "unknown"
    if ((comorb.hypertension||comorb.diabetes||comorb.cardiovascular||comorb.respiratory||comorb.cancer) && !comorb.unknown && !comorb.none) return;
    if ((!comorb.hypertension&&!comorb.diabetes&&!comorb.cardiovascular&&!comorb.respiratory&&!comorb.cancer) && !comorb.unknown && comorb.none) return;
    if ((!comorb.hypertension&&!comorb.diabetes&&!comorb.cardiovascular&&!comorb.respiratory&&!comorb.cancer) && comorb.unknown &&!comorb.none) return;
    // Only set if not already exactly { unknown: true }
    setComorb(prev => ({ ...prev, unknown: false, none: false }));
  }, [comorb.hypertension,comorb.diabetes,comorb.cardiovascular,comorb.respiratory,comorb.cancer]);

    useMemo(() => {
    // If "none" is set, clear all other comorbidities
    if (comorb.none) {
      // set other comorbidities to false
      setComorb(prev => ({hypertension: false, diabetes: false, cardiovascular: false, respiratory: false, cancer: false, unknown: false, none: true }));
    } else {
      // if none is false
      // if any other comorbidity is true, do nothing
      if (comorb.hypertension||comorb.diabetes||comorb.cardiovascular||comorb.respiratory||comorb.cancer||comorb.unknown) return;
      setComorb(prev => ({ ...prev, unknown: false }));
    }
  }, [comorb.none]);


  //Symptom unknown logic
  useMemo(() => {
    if (knownSymptoms == "unknown" && (commonCount + lessCommonCount + seriousCount == 0)) return;
    if (knownSymptoms == "true" && (commonCount + lessCommonCount + seriousCount > 0)) return;
    if (knownSymptoms == "false" && (commonCount + lessCommonCount + seriousCount == 0)) return;
    if (knownSymptoms === "unknown") {
      setCommon({fever:false, dryCough:false, tiredness:false});
      setLessCommon({aches:false, soreThroat:false, diarrhea:false, conjunctivitis:false, headache:false, anosmia:false, runnyNose:false});
      setSerious({breathing:false, chestPain:false, lossSpeech:false});
    }
    if (knownSymptoms === "false") {
      setCommon({fever:false, dryCough:false, tiredness:false});
      setLessCommon({aches:false, soreThroat:false, diarrhea:false, conjunctivitis:false, headache:false, anosmia:false, runnyNose:false});
      setSerious({breathing:false, chestPain:false, lossSpeech:false});
    }
  },[knownSymptoms])

  useMemo(() => {
    // If any symptom is set, set knownSymptoms to true
    if (commonCount + lessCommonCount + seriousCount > 0) {
      setKnownSymptoms("true");
    }
    if ((commonCount + lessCommonCount + seriousCount == 0) && knownSymptoms == "false") {
      setKnownSymptoms("false");
    }
  },[common, lessCommon, serious])

  // ========================================================
  // ================= Expert System Engine =================
  // ========================================================
  const cancelled = useRef(false); // declare before effects
  const [score, setScore] = useState(0);
  const [probJointInfectedBioSym, setProbJointInfectedBioSym] = useState(0);
  const [probJointNotInfectedBioSym, setProbJointNotInfectedBioSym] = useState(0);
  const [probConditionHistoryIfInfected, setProbConditionHistoryIfInfected] = useState(0);
  const [probConditionHistoryIfNotInfected, setProbConditionHistoryIfNotInfected] = useState(0);

  // 1) Gather inputs in a stable object so deps don’t change every render
  const inputs = useMemo(() => ({
    ageAbove70, sex, comorb,
    closeContact, closeContactDays,
    crowdedIndoor, crowdedDays,
    travelVirusville, travelDays,
    surfaceExposure, surfaceType, surfaceHours,
    common, lessCommon, serious,
    seriousCount, comorbidityCount, commonCount, lessCommonCount,
    surfacePlasticSteel, surfaceCopperCardboard, score, knownSymptoms,
    probJointInfectedBioSym, probJointNotInfectedBioSym, probConditionHistoryIfInfected, probConditionHistoryIfNotInfected
  }), [
    ageAbove70, sex, comorb,
    closeContact, closeContactDays,
    crowdedIndoor, crowdedDays,
    travelVirusville, travelDays,
    surfaceExposure, surfaceType, surfaceHours,
    common, lessCommon, serious,
    seriousCount, comorbidityCount, commonCount, lessCommonCount,
    surfacePlasticSteel, surfaceCopperCardboard, score, knownSymptoms,
    probJointInfectedBioSym, probJointNotInfectedBioSym, probConditionHistoryIfInfected, probConditionHistoryIfNotInfected
  ]);

  function buildEngine({inputs, prolog = {}}) {
    const explanations = [];

    // Serious symptoms → immediate emergency guidance
    const seriousPresent = seriousCount > 0;
    if (seriousPresent) {
      explanations.push(
        `Serious symptom(s) reported: ${SERIOUS_SYMPTOMS.filter(s => serious[s.key])
          .map(s => s.label)
          .join(", ")}. Immediate medical attention advised.`
      );
    }

    // Symptoms scoring

    if (commonCount > 0) {
      explanations.push(`Common symptoms: ${commonCount}.`);
    }
    if (lessCommonCount > 0) {
      explanations.push(`Less Common symptoms: ${lessCommonCount}.`);
    }
    if (seriousCount > 0) {
      explanations.push(`Serious symptoms: ${seriousCount}.`);
    }


    // Exposure timing windows (≤ 14 days)
    const inWindow = (days) => days !== "" && Number(days) >= 0 && Number(days) <= 14;
    if (closeContact=="true") {
      explanations.push(`Recent close contact within 14 days.`);
    }
    if (crowdedIndoor=="true") {
      explanations.push(`Visited crowded indoor place within 14 days.`);
    }
    if (travelVirusville=="true") {
      explanations.push(`Travel/exposure in Virusville within 14 days.`);
    }

    // Surface viability window
    if (surfacePlasticSteel=="true") {
      explanations.push(`Touched plastic/stainless surface within 72h.`);
    }

    // Copper/cardboard shorter window
    if (surfaceCopperCardboard=="true") {
      explanations.push(`Touched copper/cardboard surface within 24h.`);
    }
    if (closeContact!=="true" && crowdedIndoor!=="true" && travelVirusville!=="true" && surfacePlasticSteel!=="true" && surfaceCopperCardboard!=="true") {
      explanations.push(`Exposure window ≤14 days considered`);
    }
    

    // Risk modifiers: age & comorbidities
    if (ageAbove70=="true") {
      explanations.push(`Age ≥ 70.`);
    }
    if (comorbidityCount > 0 && comorb.unknown==false) {
      explanations.push(`Comorbidities.`);
    }
    if (sex === "male") {
      explanations.push(`Male with more risk.`);
    }
    if (sex === "female") {
      explanations.push(`Female with less risk.`);
    }

    // Classification thresholds
    // Emergency overrides risk if any serious symptom present
    let classification = "Unlikely";
    let color = "emerald";
    let recommendation = "No immediate signs suggest infection. Monitor your health and practice hygiene.";

    const HIGH = 0.70;
    const MID = 0.50;

    if (seriousPresent) {
      classification = "Emergency";
      color = "rose";
      recommendation =
        "Seek immediate medical attention. Call your healthcare provider or local emergency line. Avoid direct contact with others.";
    } else if (score >= HIGH) {
      classification = "Likely infection";
      color = "orange";
      recommendation =
        "Isolate, arrange a diagnostic test, and notify close contacts. Follow local health authority guidance.";
    } else if (score >= MID) {
      classification = "Possible infection";
      color = "amber";
      recommendation =
        "Reduce contacts, consider testing, and self-monitor for symptom progression.";
    }

    // Derive additional signals
    const anySymptoms = commonCount + lessCommonCount + seriousCount > 0;

    // Build rationale list with compact summary on top
    const rationale = [
      `Score = ${score.toFixed(2)} ( HIGH ≥ ${HIGH} , MID ≥ ${MID} )`,
      anySymptoms ? `Symptoms reported: yes` : `Symptoms reported: no`,
      ...explanations,
    ];
    //console.log("Rationale:", rationale);

    return { score, classification, color, recommendation, rationale, anySymptoms, seriousPresent };
  }

  // 2) Engine state from pure builder
  const [engine, setEngine] = useState(() => buildEngine(inputs));


  // 3) Run Prolog async and PATCH the probability when it finishes
  useEffect(() => {
    let query_string;

    cancelled.current = false;

    if (!cancelled.current) {
      query_string = swi_prolog_query_string();

      (async () => {
        const swipl = await SWIPL({ arguments: ["-q"] });
        const url = new URL(`${import.meta.env.BASE_URL}/prolog/bayesianModel.pl`, window.location.origin).href;
        await swipl.prolog.consult(url);

        const q = swipl.prolog.query(
          query_string
          //"prob(infected=1,[commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0],[close=1, indoor=1], P)."
        );

        // choose how to turn xs into a score
        const [newScore, newProbJointInfectedBioSym, newProbJointNotInfectedBioSym, newProbConditionHistoryIfInfected, newProbConditionHistoryIfNotInfected] = extractValueFromQueryResult(q)

        //console.log("Prolog query:", q);
        //console.log("Prolog score:", newScore);
        //console.log("newProbJointInfectedBioSym:", newProbJointInfectedBioSym);
        //console.log("newProbJointNotInfectedBioSym:", newProbJointNotInfectedBioSym);
        //console.log("newProbConditionHistoryIfInfected:", newProbConditionHistoryIfInfected);
        //console.log("newProbConditionHistoryIfNotInfected:", newProbConditionHistoryIfNotInfected);

        if (!cancelled.current) {
          // PATCH engine state so the UI re-renders with the async score
          setEngine(prev => ({ ...prev, score: newScore }));
          setScore(newScore);
          setProbJointInfectedBioSym(newProbJointInfectedBioSym)
          setProbJointNotInfectedBioSym(newProbJointNotInfectedBioSym)
          setProbConditionHistoryIfInfected(newProbConditionHistoryIfInfected)
          setProbConditionHistoryIfNotInfected(newProbConditionHistoryIfNotInfected)
        }

        setEngine(buildEngine(inputs));

      })().catch(err => {
        if (!cancelled.current) console.error(err);
      });
    }



    return () => { cancelled.current = true; };
    // add deps if the query depends on some inputs
  }, [inputs]);

  function extractValueFromQueryResult(queryResult) {
    //P
    let xs = [];
    for (let r; (r = queryResult.next()); ) {
      if (r?.value?.P == null) break;
      xs.push(r.value.P);
      xs.push(r.value.P_joint_infected_1_sym_bio);
      xs.push(r.value.P_joint_infected_0_sym_bio);
      xs.push(r.value.P_con_infected_1_history);
      xs.push(r.value.P_con_infected_0_history);
    }

    // choose how to turn xs into a score
    const newScore = xs.length ? xs[0] : 0; 

    //P_joint_infected_1_sym_bio - probJointInfectedBioSym
    const probJointInfectedBioSym = xs.length ? xs[1] : 0; 

    //P_joint_infected_0_sym_bio - probJointNotInfectedBioSym
    const probJointNotInfectedBioSym = xs.length ? xs[2] : 0; 

    //P_con_infected_1_history - probConditionHistoryIfInfected
    const probConditionHistoryIfInfected = xs.length ? xs[3] : 0; 

    //P_con_infected_0_history - probConditionHistoryIfNotInfected
    const probConditionHistoryIfNotInfected = xs.length ? xs[4] : 0; 

    if (queryResult?.close) queryResult.close();

    console.log("extractValueFromQueryResult:", [ newScore, probJointInfectedBioSym, probJointNotInfectedBioSym, probConditionHistoryIfInfected, probConditionHistoryIfNotInfected ])

    return [ newScore, probJointInfectedBioSym, probJointNotInfectedBioSym, probConditionHistoryIfInfected, probConditionHistoryIfNotInfected ];
  }

  function swi_prolog_query_string(){
    //"prob(infected=1,[commonS=1, less_commonS=1, seriousS=1, male=1, age_above70=0, pre_condition=0],[close=1, indoor=1, travel=1, plastic=1, copper=1], P)."
    //"prob(query,condition_S,condition_H, P)."

    //initialize
    let query="infected=1"
    let condition_S=[]
    let condition_H=[]

    //symptoms
    condition_S=(commonCount>0) ? [...condition_S.filter(x => x !== "commonS=0"), "commonS=1"]:[...condition_S.filter(x => x !== "commonS=1"), "commonS=0"];
    condition_S=(lessCommonCount>0) ? [...condition_S.filter(x => x !== "less_commonS=0"), "less_commonS=1"]:[...condition_S.filter(x => x !== "less_commonS=1"), "less_commonS=0"];
    condition_S=(seriousCount>0) ? [...condition_S.filter(x => x !== "seriousS=0"), "seriousS=1"]:[...condition_S.filter(x => x !== "seriousS=1"), "seriousS=0"];
    condition_S=(sex=="male") ? [...condition_S.filter(x => x !== "male=0"), "male=1"]:[...condition_S.filter(x => x !== "male=1"), "male=0"];
    condition_S=(ageAbove70=="true") ? [...condition_S.filter(x => x !== "age_above70=0"), "age_above70=1"]:[...condition_S.filter(x => x !== "age_above70=1"), "age_above70=0"];
    condition_S=(comorbidityCount>0) ? [...condition_S.filter(x => x !== "pre_condition=0"), "pre_condition=1"]:[...condition_S.filter(x => x !== "pre_condition=1"), "pre_condition=0"];

    //unknown handling - if unknown, remove both 0 and 1 for that variable
    condition_S=(sex=="unknown"||sex=="other") ? [...condition_S.filter(x => x !== "male=0" && x !== "male=1")]:condition_S;
    condition_S=(ageAbove70=="unknown") ? [...condition_S.filter(x => x !== "age_above70=0" && x !== "age_above70=1")]:condition_S;
    condition_S=(comorb.unknown) ? [...condition_S.filter(x => x !== "pre_condition=0" && x !== "pre_condition=1")]:condition_S;
    console.log("knownSymptoms:", knownSymptoms)
    condition_S=(knownSymptoms=="unknown") ? [...condition_S.filter(x => x !== "commonS=0" && x !== "commonS=1" 
                                                             && x !== "less_commonS=0" && x !== "less_commonS=1"
                                                             && x !== "seriousS=0" && x !== "seriousS=1")]:condition_S;

    //exposure
    condition_H=(closeContact=="true") ? [...condition_H.filter(x => x !== "close=0"), "close=1"]:[...condition_H.filter(x => x !== "close=1"), "close=0"];
    condition_H=(crowdedIndoor=="true") ? [...condition_H.filter(x => x !== "indoor=0"), "indoor=1"]:[...condition_H.filter(x => x !== "indoor=1"), "indoor=0"];
    condition_H=(travelVirusville=="true") ? [...condition_H.filter(x => x !== "travel=0"), "travel=1"]:[...condition_H.filter(x => x !== "travel=1"), "travel=0"];
    condition_H=(surfacePlasticSteel=="true") ? [...condition_H.filter(x => x !== "plastic=0"), "plastic=1"]:[...condition_H.filter(x => x !== "plastic=1"), "plastic=0"];
    condition_H=(surfaceCopperCardboard=="true") ? [...condition_H.filter(x => x !== "copper=0"), "copper=1"]:[...condition_H.filter(x => x !== "copper=1"), "copper=0"];

    //unknown handling - if unknown, remove both 0 and 1 for that variable
    condition_H=(closeContact=="unknown") ? [...condition_H.filter(x => x !== "close=0" && x !== "close=1")]:condition_H;
    condition_H=(crowdedIndoor=="unknown") ? [...condition_H.filter(x => x !== "indoor=0" && x !== "indoor=1")]:condition_H;
    condition_H=(travelVirusville=="unknown") ? [...condition_H.filter(x => x !== "travel=0" && x !== "travel=1")]:condition_H;
    condition_H=(surfacePlasticSteel=="unknown") ? [...condition_H.filter(x => x !== "plastic=0" && x !== "plastic=1")]:condition_H;
    condition_H=(surfaceCopperCardboard=="unknown") ? [...condition_H.filter(x => x !== "copper=0" && x !== "copper=1")]:condition_H;

    //combine to form query string
    let query_string="prob("+query+",["+condition_S.join(", ")+"],["+condition_H.join(", ")+"], P, P_joint_infected_1_sym_bio, P_joint_infected_0_sym_bio, P_con_infected_1_history, P_con_infected_0_history)."
    
    //console.log("condition_S:",condition_S.join(", "))
    //console.log("condition_H:",condition_H.join(", "))
    console.log("query_string2:", query_string)


    return query_string

  }

  // ========================================================
  // ================= Expert System Engine =================
  // ========================================================


  const resetAll = () => {
    setAgeAbove70("unknown");
    setSex("unknown");
    setComorb({unknown: true});
    setCloseContact("unknown");
    setCloseContactDays(3);
    setCrowdedIndoor("unknown");
    setCrowdedDays(5);
    setTravelVirusville("unknown");
    setTravelDays(10);
    setSurfacePlasticSteel("unknown");
    setSurfaceCopperCardboard("unknown");
    setSurfaceHours(12);
    setKnownSymptoms("unknown");
    setOnsetDate("");
    setCommon({});
    setLessCommon({});
    setSerious({});
    setEvaluated(false);
  };

  const loadDemo1 = () => {
    setAgeAbove70("true");
    setSex("male");
    setComorb({ hypertension: true });
    setCloseContact("true");
    setCrowdedIndoor("true");
    setTravelVirusville("false");
    setSurfacePlasticSteel("true");
    setSurfaceCopperCardboard("false");
    setKnownSymptoms("true");
    setCommon({ fever: true, dryCough: true, tiredness: false });
    setLessCommon({ anosmia: true, headache: true });
    setSerious({});
    setEvaluated(true);
  };

  const loadDemo2 = () => {
    setAgeAbove70("false");
    setSex("female");
    setComorb({ none: true });
    setCloseContact("false");
    setCrowdedIndoor("unknown");
    setTravelVirusville("unknown");
    setSurfacePlasticSteel("unknown");
    setSurfaceCopperCardboard("unknown");
    setKnownSymptoms("true");
    setCommon({});
    setLessCommon({});
    setSerious({chestPain: true});
    setEvaluated(true);
  };

  const loadDemo3 = () => {
    setAgeAbove70("false");
    setSex("unknown");
    setComorb({ respiratory: true, cancer: true });
    setCloseContact("unknown");
    setCrowdedIndoor("unknown");
    setTravelVirusville("unknown");
    setSurfacePlasticSteel("unknown");
    setSurfaceCopperCardboard("unknown");
    setKnownSymptoms("true");
    setCommon({dryCough: true});
    setLessCommon({});
    setSerious({});
    setEvaluated(true);
  };


  return (
    <div className="justify-center min-h-screen bg-gradient-to-b from-slate-50 to-slate-100 text-slate-900">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        {/* Header */}
        <div className="mb-8 flex items-center justify-between gap-4 flex-wrap">
          <div className="flex items-start gap-3 items-center">
            <div className="p-2 rounded-xl bg-slate-900 text-white">
              <Activity className="w-10 h-10" />
            </div>
            <div>
              <h1 className="text-2xl font-bold leading-tight">Virus Triage Expert System (2519)</h1>
              <p className="text-slate-600 max-w-3xl text-sm">
                Decision support tool based on patient status and recent exposures. Not a medical diagnosis.<br/>
                Developed by Chan Man Chak
              </p>
            </div>
          </div>

          <div className="flex items-center gap-2">
            <button
              className="px-3 py-2 text-sm rounded-lg border border-slate-300 bg-white hover:border-slate-400 hover:bg-slate-400"
              onClick={loadDemo1}
            >Demo 1</button>
            <button
              className="px-3 py-2 text-sm rounded-lg border border-slate-300 bg-white hover:border-slate-400 hover:bg-slate-400"
              onClick={loadDemo2}
            >Demo 2</button>
            <button
              className="px-3 py-2 text-sm rounded-lg border border-slate-300 bg-white hover:border-slate-400 hover:bg-slate-400"
              onClick={loadDemo3}
            >Demo 3</button>
            <button
              className="px-5 py-2 text-sm rounded-lg border border-red-400 text-white bg-red-400 hover:border-red-800 hover:bg-red-800 "
              onClick={resetAll}
            >Reset</button>
          </div>
        </div>

        {/* Grid */}
        <div className="grid grid-cols-1 xl:grid-cols-3 gap-6">
          {/* Left Column: Inputs */}
          <div className="xl:col-span-2 grid grid-cols-1 lg:grid-cols-1 gap-6">
            <Section icon={User} title="Patient bio" subtitle="Basic demographics and pre-existing conditions">
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-5">
                <Labeled label="Age">
                  <select
                    className="px-3 py-2 text-sm rounded-lg border border-slate-300 bg-white"
                    value={ageAbove70}
                    onChange={(v) => setAgeAbove70(v.target.value)}
                  >
                    <option value="unknown"> </option>
                    <option value="true">above 70</option>
                    <option value="false">equal or under 70</option>
                  </select>
                </Labeled>
                <Labeled label="Sex">
                  <div className="items-center gap-3 xl:flex items-center gap-3 ">
                    {[
                      { key: "female", label: "Female" },
                      { key: "male", label: "Male" },
                      { key: "other", label: "Others" },
                      { key: "unknown", label: "Not Available" },
                    ].map((o) => (
                      <label key={o.key} className="flex items-center gap-2 text-sm mb-1">
                        <input
                          type="radio"
                          name="sex"
                          className="w-4 h-4"
                          checked={sex === o.key}
                          onChange={() => setSex(o.key)}
                        />
                        {o.label}
                      </label>
                    ))}
                  </div>
                </Labeled>
              </div>

              <Labeled label="Pre-existing conditions" hint="Select all that apply">
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
                  {COMORBIDITIES.map((c) => (
                    <Checkbox
                      key={c.key}
                      id={`comorb-${c.key}`}
                      checked={!!comorb[c.key]}
                      onChange={(v) => setComorb((s) => ({ ...s, [c.key]: v }))}
                      label={c.label}
                    />
                  ))}
                </div>
              </Labeled>
            </Section>

            <Section icon={ClipboardList} title="Exposure history" subtitle="Events within the last 14 days">
              <div className="space-y-4">
                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <Labeled label="Close proximity contact with infected/symptomatic person within 14 days">
                    <div className="flex items-center gap-3">
                    {[
                        { key: "true", label: "Yes" },
                        { key: "false", label: "No" },
                        { key: "unknown", label: "Not Available" },
                      ].map((o) => (
                        <label key={o.key} className="flex items-center gap-2 text-sm">
                          <input
                            type="radio"
                            name="closeContact"
                            className="w-4 h-4"
                            checked={closeContact === o.key}
                            onChange={() => setCloseContact(o.key)}
                          />
                          {o.label}
                        </label>
                      ))}
                    </div>
                  </Labeled>
                </div>

                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <Labeled label="Visited crowded indoor space within 14 days">
                    <div className="flex items-center gap-3">
                    {[
                        { key: "true", label: "Yes" },
                        { key: "false", label: "No" },
                        { key: "unknown", label: "Not Available" },
                      ].map((o) => (
                        <label key={o.key} className="flex items-center gap-2 text-sm">
                          <input
                            type="radio"
                            name="crowdedIndoor"
                            className="w-4 h-4"
                            checked={crowdedIndoor === o.key}
                            onChange={() => setCrowdedIndoor(o.key)}
                          />
                          {o.label}
                        </label>
                      ))}
                    </div>
                  </Labeled>
                </div>

                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <Labeled label="Travel to/through Virusville">
                    <div className="flex items-center gap-3">
                    {[
                        { key: "true", label: "Yes" },
                        { key: "false", label: "No" },
                        { key: "unknown", label: "Not Available" },
                      ].map((o) => (
                        <label key={o.key} className="flex items-center gap-2 text-sm">
                          <input
                            type="radio"
                            name="travelVirusville"
                            className="w-4 h-4"
                            checked={travelVirusville === o.key}
                            onChange={() => setTravelVirusville(o.key)}
                          />
                          {o.label}
                        </label>
                      ))}
                    </div>
                  </Labeled>
                </div>

                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <Labeled label="Touched potentially contaminated Plastic/Stainless surfaces within 14 days">
                    <div className="flex items-center gap-3">
                    {[
                        { key: "true", label: "Yes" },
                        { key: "false", label: "No" },
                        { key: "unknown", label: "Not Available" },
                      ].map((o) => (
                        <label key={o.key} className="flex items-center gap-2 text-sm">
                          <input
                            type="radio"
                            name="surfacePlasticSteel"
                            className="w-4 h-4"
                            checked={surfacePlasticSteel === o.key}
                            onChange={() => setSurfacePlasticSteel(o.key)}
                          />
                          {o.label}
                        </label>
                      ))}
                    </div>
                  </Labeled>
                </div>

                <div className="flex items-center justify-between gap-3 flex-wrap">
                  <Labeled label="Touched potentially contaminated Copper/Carboard surfaces within 14 days">
                    <div className="flex items-center gap-3">
                    {[
                        { key: "true", label: "Yes" },
                        { key: "false", label: "No" },
                        { key: "unknown", label: "Not Available" },
                      ].map((o) => (
                        <label key={o.key} className="flex items-center gap-2 text-sm">
                          <input
                            type="radio"
                            name="surfaceCopperCardboard"
                            className="w-4 h-4"
                            checked={surfaceCopperCardboard === o.key}
                            onChange={() => setSurfaceCopperCardboard(o.key)}
                          />
                          {o.label}
                        </label>
                      ))}
                    </div>
                  </Labeled>
                </div>

                <p className="text-xs text-left text-slate-500 mt-2">
                  Incubation window typically 1–14 days. On non-biological surfaces, survivability can be hours (copper/cardboard) up to days (plastic/stainless).
                </p>
              </div>
            </Section>

            <Section icon={Stethoscope} title="Symptoms" subtitle="Select current symptoms and provide onset date if known">
              <div className="grid grid-cols-1 gap-5">
                <Labeled label="Do you know symptoms information?">
                  <div className="flex items-center gap-3">
                    {[
                          { key: "true", label: "Yes" },
                          { key: "false", label: "No" },
                          { key: "unknown", label: "Not Available" },
                        ].map((o) => (
                          <label key={o.key} className="flex items-center gap-2 text-sm">
                            <input
                              type="radio"
                              name="knownSymptoms"
                              className="w-4 h-4"
                              checked={knownSymptoms === o.key}
                              onChange={() => setKnownSymptoms(o.key)}
                            />
                            {o.label}
                          </label>
                        ))}
                  </div>
                </Labeled>
                <div>
                  {
                    knownSymptoms === "true" &&  (commonCount + lessCommonCount + seriousCount == 0) ? (
                      <div className="flex p-3 rounded-xl bg-yellow-50 border border-yellow-200 text-sm text-yellow-800 gap-2 mb-2">
                        <Info className="w-4 h-4 mb-2" />
                        <span className="font-medium">You indicated you know the symptoms, but none are selected. Please review.</span>
                      </div>
                    ) : null
                  }
                  <div className="text-sm text-left font-medium mb-2">Common</div>
                  <Pills
                    items={COMMON_SYMPTOMS}
                    state={common}
                    onToggle={(k, v) => setCommon((s) => ({ ...s, [k]: v }))}
                  />
                </div>

                <div>
                  <div className="text-sm text-left font-medium mb-2">Less common</div>
                  <Pills
                    items={LESS_COMMON_SYMPTOMS}
                    state={lessCommon}
                    onToggle={(k, v) => setLessCommon((s) => ({ ...s, [k]: v }))}
                  />
                </div>

                <div>
                  <div className="text-sm text-left font-medium mb-2">Serious (seek urgent care)</div>
                  <Pills
                    items={SERIOUS_SYMPTOMS}
                    state={serious}
                    onToggle={(k, v) => setSerious((s) => ({ ...s, [k]: v }))}
                  />
                </div>
              </div>
            </Section>
          </div>

          {/* Right Column: Results */}
          <div className="xl:col-span-1 gap-4 space-y-4">
            <OutputSection
              icon={ShieldCheck}
              title="Assessment"
              subtitle="Probability-based triage derived from your inputs"
            >
              {/* Color theme by classification */}
              
              {
                knownSymptoms === "true" &&  (commonCount + lessCommonCount + seriousCount == 0) ? (
                  <div className="flex p-3 rounded-xl bg-yellow-50 border border-yellow-200 text-sm text-yellow-800 gap-2 mb-2">
                    <Info className="w-8 h-8 mb-2" />
                    <span className="font-medium">You indicated you know the symptoms, but none are selected. Please review.</span>
                  </div>
                ) : <Badge classification={engine.classification} color={engine.color} />
              }
              

              <div className="mt-4 space-y-3">
                {
                  knownSymptoms === "true" &&  (commonCount + lessCommonCount + seriousCount == 0) ? (null
                  ) : (
                    <div>
                      <div className="flex items-center justify-between">
                        <span className="text-sm text-white">Probability of infection</span>
                        <span className="text-sm font-semibold text-white">{engine.score.toFixed(2)} / 1.00</span>
                      </div>
                      <Progress value={engine.score} max={1} />
                    </div>
                  )
                }
                


                <div className="p-3 rounded-xl bg-slate-50 border border-slate-200 text-sm">
                  <p className="font-medium mb-1">Recommendation</p>
                  <p className="text-slate-700">{engine.recommendation}</p>
                </div>

                {(
                  <div className="p-3 rounded-xl bg-white border border-slate-200 text-sm max-h-80 overflow-auto">
                    <div className="flex items-center gap-2 mb-2">
                      <Info className="w-4 h-4" />
                      <span className="font-medium">Why this result?</span>
                    </div>
                    <ul className="list-disc pl-5 space-y-1 text-slate-700 text-left">
                      {engine.rationale.map((r, i) => (
                        <li key={i}>{r}</li>
                      ))}
                    </ul>
                  </div>
                )}

                <div className="text-[11px] text-slate-400 leading-relaxed">
                  <p className="mb-2">
                    <strong>Important:</strong> This tool is for decision support and does not provide a medical diagnosis. If you experience serious symptoms, call your healthcare provider immediately.
                  </p>
                  <p>
                    Transparency: rules consider symptom patterns (common/less common/serious), exposure timing (≤14 days), surface viability windows (≤72h plastic/steel, ≤24h copper/cardboard), and risk modifiers (age ≥70, comorbidities, male w/ risk).
                  </p>
                </div>
              </div>
            </OutputSection>

            <OutputSection icon={AlertTriangle} title="When to seek urgent care">
              <ul className="list-disc pl-5 text-sm text-left text-white space-y-1">
                <li>Difficulty breathing or shortness of breath</li>
                <li>Chest pain or pressure</li>
                <li>Loss of speech or movement</li>
              </ul>
            </OutputSection>
            <OutputSection icon={ChartColumn} title="Probability via Prolog">
              <table className="table-auto border-collapse border border-white text-sm text-left w-full mt-2 text-white">
                <thead>
                  <tr className="border border-white">
                    <th className="border border-white text-center">Probability</th>
                    <th className="text-center">Value</th>
                  </tr>
                </thead>
                <tbody>
                  <tr className="border border-white">
                    <td className="border border-white text-xs"> &nbsp; P( Infected, Bio, Symptom )</td>
                    <td className="text-center"> {probJointInfectedBioSym.toFixed(5)} </td>
                  </tr>
                  <tr className="border border-white">
                    <td className="border border-white text-xs"> &nbsp; P( Not Infected, Bio, Symptom )</td>
                    <td className="text-center"> {probJointNotInfectedBioSym.toFixed(5)} </td>
                  </tr>
                  <tr className="border border-white">
                    <td className="border border-white text-xs"> &nbsp; P( History | Infected )</td>
                    <td className="text-center"> {probConditionHistoryIfInfected.toFixed(5)} </td>
                  </tr>
                  <tr className="border border-white">
                    <td className="border border-white text-xs"> &nbsp; P( History | Not Infected )</td>
                    <td className="text-center"> {probConditionHistoryIfNotInfected.toFixed(5)} </td>
                  </tr>
                  <tr className="border border-white">
                    <td className="border border-white text-xs"> &nbsp; P( Infected | All Conditions )</td>
                    <td className="text-center"> 
                      <table className="w-full">
                        <tr>
                            <td className="w-12 underline">{(probJointInfectedBioSym*probConditionHistoryIfInfected).toFixed(6)}</td>
                            <td rowspan="2" className="w-10">= {(probJointInfectedBioSym*probConditionHistoryIfInfected/(probJointInfectedBioSym*probConditionHistoryIfInfected+probJointNotInfectedBioSym*probConditionHistoryIfNotInfected)).toFixed(2)}</td>
                        </tr>
                        <tr>
                            <td className="w-12 items-start">{(probJointInfectedBioSym*probConditionHistoryIfInfected+probJointNotInfectedBioSym*probConditionHistoryIfNotInfected).toFixed(6)}</td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div className="p-3 mt-3 rounded-xl bg-white border border-slate-200 text-sm max-h-48 overflow-auto">
                <div className="flex items-center gap-2 mb-2">
                      <Info className="w-4 h-4" />
                      <span className="font-medium">Probability Model Assumption</span>
                    </div>
                <p className="text-xs text-left text-slate-700">
                  <b><u>P( Infected, Bio, Symptom ) -- P(I,B,S)</u></b><br />
                  joint probability of infection with given symptoms and bio factors <br />
                  <b><u>P( Not Infected, Bio, Symptom ) -- P(~I,B,S)</u></b><br />
                  joint probability of no infection with given symptoms and bio factors <br />
                  <b><u>P( History | Infected ) -- P(H|I)</u></b><br />
                  probability of exposure history given infection <br />
                  <b><u>P( History | Not Infected ) -- P(H|~I)</u></b><br />
                  probability of exposure history given no infection <br />
                  <br />
                  Using Bayes' theorem to combine symptom/bio probabilities with exposure history: <br />
                  <b><u>P( Infected | All Conditions ) = </u></b><br /> 
                  <b>P(I,B,S)P(H|I)/[P(I,B,S)P(H|I)+P(~I,B,S)P(H|~I)]</b>
                  <br />
                  <br />
                  Note: The probabilities above are illustrative outputs from the Prolog engine based on the provided inputs. They represent the joint and conditional probabilities used in the Bayesian update to estimate the likelihood of infection given all conditions.
                </p>

              </div>
              <div className="w-full">
                <EnlargeableImage src={variablePng} className="w-full mt-3 rounded-2xl" />
              </div>
              

            </OutputSection>
          </div>
        </div>
      </div>
    </div>
  );
}

function Badge({ classification, color }) {
  const palette = {
    emerald: { bg: "bg-emerald-50", text: "text-emerald-800", ring: "ring-emerald-200" },
    amber: { bg: "bg-amber-50", text: "text-amber-900", ring: "ring-amber-200" },
    orange: { bg: "bg-orange-50", text: "text-orange-900", ring: "ring-orange-200" },
    rose: { bg: "bg-rose-50", text: "text-rose-900", ring: "ring-rose-200" },
  }[color || "emerald"]; 

  const Icon = classification === "Emergency" ? AlertTriangle : classification === "Likely infection" ? AlertTriangle : ShieldCheck;

  return (
    <div className={`inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-sm ${palette.bg} ${palette.text} ring-1 ${palette.ring}`}>
      <Icon className="w-4 h-4" />
      <span className="font-semibold">{classification}</span>
    </div>
  );
}


function EnlargeableImage({ src, alt = "", className = "" }) {
  const [open, setOpen] = useState(false);

  // Close on Esc + lock body scroll while open
  useEffect(() => {
    if (!open) return;
    const onKey = (e) => e.key === "Escape" && setOpen(false);
    const prevOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    window.addEventListener("keydown", onKey);
    return () => {
      window.removeEventListener("keydown", onKey);
      document.body.style.overflow = prevOverflow;
    };
  }, [open]);

  return (
    <>
      <img
        src={src}
        alt={alt}
        onClick={() => setOpen(true)}
        className={`cursor-zoom-in ${className}`}
      />

      {open &&
        createPortal(
          <div
            className="fixed inset-0 z-[9999] bg-black/70 flex items-center justify-center p-4"
            role="dialog"
            aria-modal="true"
            onClick={() => setOpen(false)}                 // click backdrop closes
          >
            <div
              className="relative m-0 max-w-[90vw] max-h-[90vh]"
              onClick={(e) => e.stopPropagation()}         // don't close when clicking the image
            >
              <img
                src={src}
                alt={alt}
                className="block max-w-[90vw] max-h-[90vh] object-contain rounded shadow-lg"
              />

              <button
                type="button"
                aria-label="Close"
                onClick={() => setOpen(false)}
                className="absolute top-2 right-2 w-8 h-8 rounded-full bg-white/90 hover:bg-white text-black text-xl leading-none grid place-items-center shadow"
              >
                ×
              </button>

              {alt && (
                <div className="mt-2 text-center text-white/80 text-sm">
                  {alt}
                </div>
              )}
            </div>
          </div>,
          document.body
        )}
    </>
  );
}