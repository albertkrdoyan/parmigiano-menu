import LanguageSelector from "./LanguageSelector";
import { Logo } from "./Logo";
import "../Styles/header.css";

const Header = ({
  onLangChange,
  setIsLoading,
  isSMSBLoading,
  setIsSMSBLoading,
}) => {
  return (
    <header>
      <Logo />
      <LanguageSelector
        onLangChange={onLangChange}
        setIsLoading={setIsLoading}
        setIsSMSBLoading={setIsSMSBLoading}
      />
    </header>
  );
};

export default Header;
