import React from "react";
import { useNavigate } from "react-router-dom";
import { resetUserSession } from "./service/AuthServices";

const Logut = () => {
  const history = useNavigate();
  const logoutHandler = () => {
    resetUserSession();
    history("/login");
  };
  return (
    <div>
      <h5>
        <LogutContainer />
      </h5>
      <button type="button" onClick={logoutHandler}>
        click me
      </button>
    </div>
  );
};

export default Logut;
