import { useEffect, useState } from "react";
import SWIPL from "swipl-wasm";

export default function PrologDemoSimpleCode() {
  const [out, setOut] = useState("loading…");

  useEffect(() => {
    let cancelled = false;
    (async () => {

      const swipl = await SWIPL({ arguments: ["-q"] }); // -q = quiet

      // Define a tiny program and ask a query
      // (for larger programs, see “prebuilt image” below)
      const q1 = swipl.prolog.query("member(X, [a,b,c]).");
      const first = q1.once().X; // one solution
      if (!cancelled) setOut(`first member/2 solution: ${first}`);
    })().catch(e => setOut(String(e)));
    return () => { cancelled = true; };
  }, []);

  return <pre>{out}</pre>;
}