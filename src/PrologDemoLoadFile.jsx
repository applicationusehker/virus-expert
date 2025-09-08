import { useEffect, useRef, useState } from "react";
import SWIPL from "swipl-wasm";

export default function PrologDemoLoadFile() {
  const [out, setOut] = useState("loading…");
  const cancelled = useRef(false);

  useEffect(() => {
    cancelled.current = false;
    let q;

    (async () => {
      const swipl = await SWIPL({ arguments: ["-q"] });
      const url = new URL("/prolog/test.pl", window.location.href).href;
      await swipl.prolog.consult(url);

      q = swipl.prolog.query("prob(rain=true, [cloudy=true], P).");
      const xs = [];
      for (let r; (r = q.next()); ) {
        if (r?.value?.P == null) break;
        xs.push(r.value.P);
      }
      // free query if the lib provides it
      if (q?.close) q.close();

      if (!cancelled.current) setOut(xs.join(", "));
    })().catch(e => {
      if (!cancelled.current) setOut(String(e));
    });

    return () => {
      cancelled.current = true;
      if (q?.close) q.close();
    };
  }, []);

  return <pre>{out}</pre>;
}