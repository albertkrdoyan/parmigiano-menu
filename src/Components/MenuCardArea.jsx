import { useState, useEffect } from "react";
import { LoadingMenuCards } from "./LoadingMenuCards";

import "../Styles/MenuCardArea.css";

const IMG_URL = import.meta.env.VITE_IMAGE_URL;
const API_URL = import.meta.env.VITE_API_URL;

export const MenuCardArea = ({ language, subMenu, selectedSMI,isLoading, setIsLoading }) => {//smi -> selected sub menu item
  const [menuByCategory, setMenuByCategory] = useState([]);

  //get menu from server
  useEffect(() => {
    const GetMenu = async () => {
      if (selectedSMI === -1 || language == "def") return;

      const controller = new AbortController();

      try {
        const res = await fetch(`${API_URL}/api/${language}/${selectedSMI}`, {
          signal: controller.signal,
        });

        if (!res.ok) {
          throw new Error(`Error: ${res.status}, ${res.statusText}`);
        }

        const data = await res.json();
        setMenuByCategory(data.menu);
        // console.log(data);
      } catch (error) {
        console.log(error);
      }
      finally{
        setIsLoading(false);
      }
    };

    GetMenu();
  }, [selectedSMI, subMenu]);

  useEffect(() => {
    window.scrollTo({
      top : 0,
      behavior: "smooth",
    });

    // menuAreaRef.current.focus();
  }, [menuByCategory]);

  return (
    <div className="menu-card-area">
      {isLoading ? <LoadingMenuCards/> : menuByCategory.map((item, key) => (
        <div className="menu-card" key={key}>
          <img src={`${IMG_URL}${encodeURIComponent(Object.values(item)[4])}`} alt={Object.values(item)[0]} />
          <div className="name-size">
            <p className="size">{Object.values(item)[1]}</p>
            <p className="name">{Object.values(item)[0]}</p>
          </div>
          <p className="price">{Object.values(item)[2]} &#x58F;</p>
        </div>
      ))}
    </div>
  );
};
