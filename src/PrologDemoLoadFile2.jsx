import { useEffect, useState } from "react";
import SWIPL from "swipl-wasm";

export default function PrologDemoLoadFile() {
  const [out, setOut] = useState("loading…");

  useEffect(() => {
    let cancelled = false;
    (async () => {

      const swipl = await SWIPL({ arguments: ["-q"] }); // quiet

      // consult a .pl file by URL (relative to your site)
      const url = new URL("/prolog/test.pl", window.location.href).href;
      await swipl.prolog.consult(url);  // <- loads & compiles the file


      // now query
      const q = swipl.prolog.query("prob(rain=true, [cloudy=true], P)."); //0.6471
      //console.log(q);
      
      const xs = [];
      for (let r; (r = q.next()); ) {
        //console.log(r);
        if (typeof r.value != 'undefined'){
            xs.push(r.value.P)
        } else {
            break;
        }
      };
      console.log(xs);
      if (!cancelled) setOut(xs.join(", "));
    })().catch(e => setOut(String(e)));

    return () => { cancelled = true; };
  }, []);

  return <pre>{out}</pre>;
}