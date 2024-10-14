import React, { useState, useEffect } from "react";
import "./App.css";

import image1 from "./assets/dinoUm.jpg";
import image2 from "./assets/dinoDois.jpg";
import image3 from "./assets/dinoTres.jpg";

const App = () => {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const images = [
    image1, image2, image3,
  ];

  useEffect(() => {
    const intervalId = setInterval(() => {
      setCurrentImageIndex((prevIndex) => (prevIndex + 1) % images.length);
    }, 3000);

    return () => clearInterval(intervalId); 
  }, [images.length]);

  return (
    <div className="app">
      <nav className="navbar">
        <div className="navbar-left">
          <h1>Uniganhos</h1>
        </div>
        <div className="navbar-right">
          <button className="navbar-btn">Login</button>
          <button className="navbar-btn">Cadastro</button>
        </div>
      </nav>

      <div className="background-slider">
        <img
          src={images[currentImageIndex]}
          alt="Fundo"
          className="background-image"
        />
      </div>
    </div>
  );
};

export default App;
