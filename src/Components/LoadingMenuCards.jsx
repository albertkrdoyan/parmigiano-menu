import '../Styles/loadingCardAnimation.css'

export const LoadingMenuCards = () => {
  return (
    <>
      {Array.from({ length: 5 }, (_, i) => (
        <div className="menu-card skeleton-card" key={i}>
          <div className="name-size">
            <p className="size skeleton skeleton-size">a</p>
            <p className="name skeleton skeleton-name">a</p>
          </div>
          <p className="price skeleton skeleton-price">a</p>
        </div>
      ))}
    </>
  );
};
