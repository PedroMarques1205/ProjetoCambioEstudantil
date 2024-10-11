import React, { useState, useEffect } from "react";
import "./App.css";

const App = () => {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const images = [
    "https:/em+1/via.placeholder.com/1920x1080?text=Imag",
    "https://via.placeholder.com/1920x1080?text=Imagem+2",
    "https://via.placeholder.com/1920x1080?text=Imagem+3",
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
          <h1>Nome da Empresa</h1>
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
