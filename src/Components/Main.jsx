import { SubMenuScrollBar } from "./SubMenuScrollBar";
import { MenuCardArea } from "./MenuCardArea";
import "../Styles/Main.css";

const Main = ({
  language,
  subMenu,
  selectedSMI,
  setSelectedSMI,
  isLoading,
  setIsLoading,
  isSMSBLoading,
  setIsSMSBLoading
}) => {
  return (
    <main>
      <div id="scrollbar-container" className="scrollbar-container">
        <SubMenuScrollBar
          subMenu={subMenu}
          selectedSMI={selectedSMI}
          setSelectedSMI={setSelectedSMI}
          isLoading={isLoading}
          setIsLoading={setIsLoading}
          isSMSBLoading={isSMSBLoading}
          setIsSMSBLoading={setIsSMSBLoading}
        />
      </div>
      <MenuCardArea
        language={language}
        subMenu={subMenu}
        selectedSMI={selectedSMI}
        isLoading={isLoading}
        setIsLoading={setIsLoading}
      />
    </main>
  );
};

export default Main;
