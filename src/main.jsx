import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import VirusTriageExpertSystem from './virus_triage_expert_system_react.jsx'
import PrologDemoLoadFile from './PrologDemoLoadFile.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <VirusTriageExpertSystem />
  </StrictMode>,
)
