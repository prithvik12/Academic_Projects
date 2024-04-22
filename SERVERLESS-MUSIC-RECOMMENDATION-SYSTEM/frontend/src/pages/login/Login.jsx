import React, { useState } from "react";
import axios from "axios";
import setUserSession from "../login/loginServices/setUserSession";
import { useNavigate } from "react-router-dom";
import "./login.css";

const loginUrl =
  "https://y11nr5yy62.execute-api.us-east-1.amazonaws.com/prod-env/login";

const Login = (props) => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  const history = useNavigate();

  const handleSubmit = (e) => {
    console.log("hi");
    e.preventDefault();
    if (username.trim() === "" || password.trim() === "") {
      setMessage("All fields are required");
      return;
    }

    const requestConfig = {
      headers: {
        "x-api-key": "fIZChgoQF09PTrzhUWLgWa7Y5VPQI5mN3iiZc6Ek",
      },
    };

    const requestBody = {
      username: username,
      password: password,
    };
    axios
      .post(loginUrl, requestBody, requestConfig)
      .then((response) => {
        console.log(response);
        setUserSession(response.data.user, response.data.token);

        history("/discover");
      })
      .catch((error) => {
        console.log(error);
        if (error.response.status === 401) {
          setMessage(error.response.data.message);
        }
      });
  };

  return (
    <div className="LoginApp">
      {/* <img
        src="https://img.freepik.com/free-vector/musical-melody-symbols-bright-blue-splotch_1308-70426.jpg?w=2000"
        className="al-logo"
        alt="Almusiqaa"
      /> */}
      <form className="LoginForm" onSubmit={handleSubmit}>
        <div className="login-input-group">
          <label htmlFor="username">username</label>
          <input
            name="username"
            label="username"
            type="username"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div className="login-input-group">
          <label htmlFor="password">password</label>
          <input
            name="password"
            label="Password"
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <button type="submit" className="primary-login-button">
          Sign In
        </button>
      </form>
    </div>
  );
};
export default Login;
