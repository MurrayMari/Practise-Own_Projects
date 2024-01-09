import React from "react";

const Contact = () => {
  return (
    <div>
      <p className="WittyLine">Please RSVP below by May 30th</p>
      <p className="Diet">Dietary Requiments</p>
      <p className="dietdes">
        If you have any allergies or dietary requipments please advise us below
        and we will do our best to accommodate them
      </p>
      <p> </p>
      <button
        className="button2"
        onClick={() =>
          (window.location = "mailto:StillMurrayWedding@gmail.com")
        }
      >
        Contact Us
      </button>
      <p></p>
      <img
        src="https://www.casa-guardiola.com/wp-content/uploads/2022/01/200827_MZ_Casa-Guardiola-Sevilla-14_pre-2-1.jpg"
        width="200"
        alt="Casa Guardiola"
      />
    </div>
  );
};

export { Contact };
