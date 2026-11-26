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
  const [isLoading, setIsLoading] = useState(true);

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
        // console.log(`${API_URL}/api/${language}`);

        const res = await fetch(`${API_URL}/api/${language}`, {
          signal: controller.signal,
        });

        if (!res.ok) {
          throw new Error(`Error: ${res.status}, ${res.statusText}`);
        }

        const data = await res.json();

        // console.log(data.subMenu)
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

  // position fixed scroll
  useEffect(() => {
    const calculateHeight = () => {
      const header = document.querySelector("header");
      const scrollbar = document.querySelector(".scrollbar");
      const menuCardArea = document.querySelector(".menu-card-area");

      if (!header || !scrollbar || !menuCardArea) {
        return;
      }

      const headerHeight = header.offsetHeight;
      const scrollbarHeight = scrollbar.offsetHeight;
      // const scrollbarMarginTop = parseFloat(getComputedStyle(scrollbar).marginTop);

      menuCardArea.style.marginTop = `${headerHeight + scrollbarHeight * 0.85}px`;

      // console.log(menuCardArea.style.marginTop, headerHeight, scrollbarHeight, scrollbarMarginTop)
      const viewport = document.documentElement.clientWidth;
    };

    calculateHeight();
  }, []);

  return (
    <>
      <Header onLangChange={OnLangChange} />
      <Main
        language={language}
        subMenu={subMenu}
        selectedSMI={selectedSMI}
        setSelectedSMI={setSelectedSMI}
        isLoading={isLoading}
        setIsLoading={setIsLoading}
      />
      <Footer language={language} />
    </>
  );
};

export default App;
