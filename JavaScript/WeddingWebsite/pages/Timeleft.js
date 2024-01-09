import React, { useState, useEffect } from "react";

const Countdown = () => {
  const [days, setDays] = useState(0);
  const [hours, setHours] = useState(0);
  const [minutes, setMinutes] = useState(0);
  const [seconds, setSeconds] = useState(0);

  const handleTick = () => {
    const now = new Date();
    const target = new Date("2024-09-13");
    const diff = target - now;

    setDays(diff / (1000 * 60 * 60 * 24));
    setHours((diff / (1000 * 60 * 60)) % 24);
    setMinutes((diff / (1000 * 60)) % 60);
    setSeconds((diff / 1000) % 60);
  };

  useEffect(() => {
    const interval = setInterval(handleTick, 1000);
    return () => clearInterval(interval);
  }, []);

  return (
    <div>
      <h1 className="WittyLine">Countdown to La Boda</h1>
      <p className="counter">
        Days: {days}
        <br />
        Hours: {hours}
        <br />
        Minutes: {minutes}
        <br />
        Seconds: {seconds}
      </p>
    </div>
  );
};

export { Countdown };
