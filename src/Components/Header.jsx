import LanguageSelector from "./LanguageSelector";
import { Logo } from "./Logo";
import '../Styles/header.css'

const Header = ({onLangChange}) => {
  return <header>
    <Logo />
    <LanguageSelector onLangChange={onLangChange}/>
  </header>;
};

export default Header;