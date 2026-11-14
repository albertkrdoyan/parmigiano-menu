import '../Styles/Footer.css'

const Footer = ({language}) => {
  const getFooterText = () =>{
    if (language === 'eng') return "For public catering services 10%";
    else if(language === 'arm') return "Հանրային սննդի ծառայությունն 10%";
    else if(language === 'rus') return "За услуги общественного питания 10%";
  }

  return <footer>
    <p>{getFooterText()}</p>
  </footer>;
};

export default Footer;
