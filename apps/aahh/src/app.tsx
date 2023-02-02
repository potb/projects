import type React from 'react';

const aahh = async (): Promise<void> => {
  const random = Math.floor(Math.random() * 2);

  await new Audio(`/aahh_${random}.mp3`).play();
};

export const App: React.FC = () => {
  return (
    <div>
      <h1>aahh</h1>
      <img
        src="/philippe.png"
        alt="Philippe Etchebest with his mouth open"
        onClick={aahh}
      />
    </div>
  );
};
