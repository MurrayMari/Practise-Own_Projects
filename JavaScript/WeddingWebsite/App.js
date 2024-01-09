import "./styles.css";
import { Routes, Route, Link } from "react-router-dom";
import { Home } from "./pages/Home";
import { Contact } from "./pages/Contact";
import { Hotels } from "./pages/Hotels";
import Nopage from "./pages/Nopage";
import { Countdown } from "./pages/Timeleft";

function App() {
  return (
    <div className="App">
      <h1 className="WeddingHeading">StillMurray Wedding</h1>
      <h2 className="WittyLine">Stillman-Murray Boda en Espana</h2>
      <h2 className="WittyLine">September 13, 2024 • Seville, Spain</h2>

      <p>
        <Link to="">
          <button>Home</button>
        </Link>

        <Link to="hotels">
          <button>Hotels</button>
        </Link>

        <Link to="contact">
          <button>RSVP</button>
        </Link>

        <Link to="countdown">
          <button>Countdown</button>
        </Link>
      </p>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/hotels" element={<Hotels />} />
        <Route path="/countdown" element={<Countdown />} />
        <Route path="*" element={<Nopage />} />
      </Routes>

      <footer className="footer">
        <p>J&M</p>
        <p className="date">13.09.23</p>
      </footer>
    </div>
  );
}
export default App;
