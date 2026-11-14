import '../Styles/LanguageSelector.css'
import { useState, useEffect, useRef } from "react";

function LanguageSelector({onLangChange}) {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedLang, setSelectedLang] = useState("arm");

  const selectorRef = useRef(null);

  const languages = [
    { value: "arm", label: "Հայերեն" },
    { value: "rus", label: "Русский" },
    { value: "eng", label: "English" },
  ];

  function handleSelect(value) {
    setSelectedLang(value);
    setIsOpen(false);
    onLangChange(value);
  }

  return (
    <div className={`lang-selector ${isOpen ? "open" : ""}`} ref={selectorRef}>
      <div className="selected-lang" onClick={() => setIsOpen(!isOpen)}>
        {languages.find((lang) => lang.value === selectedLang).label}
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
              {lang.label}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

export default LanguageSelector;
