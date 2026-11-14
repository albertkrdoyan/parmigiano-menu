import { useEffect, useState } from "react";

import Footer from "./Components/Footer";
import Main from "./Components/Main";
import Header from "./Components/Header";

import "./Styles/App.css";

const API_URL = import.meta.env.VITE_API_URL;

const App = () => {
  const [language, setLanguage] = useState("arm");
  const [subMenu, setSubMenu] = useState([]);
  const [selectedSMI, setSelectedSMI] = useState(0);

  const OnLangChange = (value) => {
    setLanguage(value);
  };

  // loads submenu from server
  useEffect(() => {
    if (language === "def") return;

    const controller = new AbortController();

    const LoadData = async () => {
      try {
        // console.log("Language changed:", language);

        const res = await fetch(`${API_URL}/api/${language}`, {
          signal: controller.signal,
        });

        if (!res.ok) {
          throw new Error(`Error: ${res.status}, ${res.statusText}`);
        }

        const data = await res.json();
        setSubMenu(data.subMenu);
      } catch (error) {
        if (error.name !== "AbortError") {
          console.error(error);
        }
      }
    };

    LoadData();

    return () => controller.abort();
  }, [language]);

  // for footer and header to scrool, because position fixed it wont move
  useEffect(() => {
    const footer = document.querySelector("footer");
    const header = document.querySelector("header");
    const subMenuScrollbar = document.getElementById("scrollbar-container");

    const handleScroll = () => {
      footer.style.left = `-${window.scrollX}px`;
      header.style.left = `-${window.scrollX}px`;
      subMenuScrollbar.style.left = `-${window.scrollX}px`;
    };

    window.addEventListener("scroll", handleScroll);

    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return (
    <>
      <Header onLangChange={OnLangChange} />
      <Main
        language={language}
        subMenu={subMenu}
        selectedSMI={selectedSMI}
        setSelectedSMI={setSelectedSMI}
      />
      <Footer language={language} />
    </>
  );
};

export default App;
