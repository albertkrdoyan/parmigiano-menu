// import 'react-app-polyfill/ie9';
// import 'react-app-polyfill/stable';
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
  // <App />,
)