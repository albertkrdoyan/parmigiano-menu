import { useRef, useState, useEffect } from "react";
import "../Styles/SubMenuScrollBar.css";

export const SubMenuScrollBar = ({ subMenu, selectedSMI, setSelectedSMI }) => {
  const scrollRef = useRef(null);
  const itemRefs = useRef([]);

  const isDragging = useRef(false);
  const startX = useRef(0);
  const scrollLeft = useRef(0);
  const hasMoved = useRef(false);

  const [dragging, setDragging] = useState(false);

  const handleMouseDown = (e) => {
    if (e.button !== 0) return;

    isDragging.current = true;
    hasMoved.current = false;

    startX.current = e.pageX;
    scrollLeft.current = scrollRef.current.scrollLeft;

    setDragging(true);
  };

  const handleMouseMove = (e) => {
    if (!isDragging.current) return;

    const distance = e.pageX - startX.current;

    if (Math.abs(distance) > 3) {
      hasMoved.current = true;
    }

    scrollRef.current.scrollLeft = scrollLeft.current - distance;
  };

  const stopDragging = () => {
    if (!isDragging.current) return;

    isDragging.current = false;
    setDragging(false);
  };

  const handleClick = (e) => {
    if (hasMoved.current) {
      e.preventDefault();
      e.stopPropagation();
      hasMoved.current = false;
    }
  };

  useEffect(() => {
    const selectedItem = itemRefs.current[selectedSMI];
    const container = scrollRef.current;

    if (!selectedItem || !container) return;

    const target =
      selectedItem.offsetLeft -
      container.clientWidth / 2 +
      selectedItem.clientWidth / 2;

    const start = container.scrollLeft;
    const distance = target - start;

    const duration = 500; // milliseconds
    let startTime = null;

    const animate = (timestamp) => {
      if (startTime === null) startTime = timestamp;

      const progress = Math.min((timestamp - startTime) / duration, 1);

      // Ease-in-out
      const ease = -(Math.cos(Math.PI * progress) - 1) / 2;

      container.scrollTo({
        left: start + distance * ease,
        behavior: "instant",
      });

      if (progress < 1) {
        requestAnimationFrame(animate);
      }
    };

    requestAnimationFrame(animate);
  }, [selectedSMI]);

  return (
    <div
      className={`scrollbar ${dragging ? "dragging" : ""}`}
      ref={scrollRef}
      onMouseDown={handleMouseDown}
      onMouseMove={handleMouseMove}
      onMouseUp={stopDragging}
      onMouseLeave={stopDragging}
      onClickCapture={handleClick}
    >
      <ul>
        {Array.isArray(subMenu) &&
          subMenu.map((item, index) => (
            <li
              key={index}
              className={selectedSMI === index ? "selected-item" : ""}
              ref={(el) => (itemRefs.current[index] = el)}
              onClick={() => {
                setSelectedSMI(index);
                // console.log(index, " ", selectedSMI);
              }}
            >
              {item}
            </li>
          ))}
      </ul>
    </div>
  );
};
