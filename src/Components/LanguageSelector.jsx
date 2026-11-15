import "../Styles/LanguageSelector.css";
import "flag-icons/css/flag-icons.min.css";
import { useState, useRef } from "react";

function LanguageSelector({ onLangChange }) {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedLang, setSelectedLang] = useState("arm");

  const selectorRef = useRef(null);

  const languages = [
    { value: "arm", label: "Հայերեն", flag: <span className="fi fi-am"></span> },
    { value: "rus", label: "Русский", flag: <span className="fi fi-ru"></span> },
    { value: "eng", label: "English", flag: <span className="fi fi-us"></span> },
  ];

  function handleSelect(value) {
    setSelectedLang(value);
    setIsOpen(false);
    onLangChange(value);
  }

  return (
    <div className={`lang-selector ${isOpen ? "open" : ""}`} ref={selectorRef}>
      <div className="selected-lang" onClick={() => setIsOpen(!isOpen)}>                
        <span className="language-label">{languages.find((lang) => lang.value === selectedLang).label}</span>
        {languages.find((lang) => lang.value === selectedLang).flag}        
      </div>

      {isOpen && (
        <div className="lang-options">
          {languages.map((lang) => (
            <div
              key={lang.value}
              className={`lang-option ${
                selectedLang === lang.value ? "selected" : ""
              }`}
              onClick={() => handleSelect(lang.value)}
              >
              <span className="language-label">{lang.label}</span>
              {lang.flag}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default LanguageSelector;
