import {SubMenuScrollBar} from "./SubMenuScrollBar";
import { MenuCardArea } from './MenuCardArea';
import '../Styles/Main.css'

const Main = ({ language, subMenu, selectedSMI, setSelectedSMI }) => {
  return (
    <main>
      <SubMenuScrollBar subMenu={subMenu} selectedSMI={selectedSMI} setSelectedSMI={setSelectedSMI}/>
      <MenuCardArea language={language} subMenu={subMenu} selectedSMI={selectedSMI}/>
    </main>
  );
};

export default Main;
