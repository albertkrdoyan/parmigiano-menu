import {SubMenuScrollBar} from "./SubMenuScrollBar";
import { MenuCardArea } from './MenuCardArea';
import '../Styles/Main.css'

const Main = ({ language, subMenu, selectedSMI, setSelectedSMI }) => {
  return (
    <main>
      <div id="scrollbar-container" className="scrollbar-container">
        <SubMenuScrollBar subMenu={subMenu} selectedSMI={selectedSMI} setSelectedSMI={setSelectedSMI}/>
      </div>
      <MenuCardArea language={language} subMenu={subMenu} selectedSMI={selectedSMI}/>
    </main>
  );
};

export default Main;
