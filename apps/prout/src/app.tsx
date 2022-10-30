import type React from 'react';

const fart = async (): Promise<void> => {
  await new Audio('/fart.mp3').play();
};

export const App: React.FC = () => {
  return (
    <div>
      <h1>prout</h1>
      <img
        src="/butt.webp"
        useMap="#butt"
        alt="Myd butt-naked, seen from behind"
      />

      <map name="butt" onClick={fart}>
        <area
          alt="Accurate mapping of Myd butt"
          coords="99,468,77,455,67,430,69,412,86,412,105,407,125,400,131,415,137,430,136,451,123,458,114,466"
          shape="poly"
        />
      </map>
    </div>
  );
};
