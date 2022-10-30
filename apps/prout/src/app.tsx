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
          coords="73,380,50,386,44,412,41,445,53,454,77,462,102,466,125,465,161,455,189,451,202,442,203,419,200,400,181,378,165,372,110,377"
          shape="poly"
        />
      </map>
    </div>
  );
};
