import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import "./login.css";

const registerUrl =
  "https://y11nr5yy62.execute-api.us-east-1.amazonaws.com/prod-env/register";

const Register = () => {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [message, setMessage] = useState();
  const history = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    if (
      username.trim() === "" ||
      email.trim() === "" ||
      name.trim() === "" ||
      password.trim() === ""
    ) {
      setError("All fields are required");
      return;
    }

    const requestConfig = {
      headers: {
        "x-api-key": "fIZChgoQF09PTrzhUWLgWa7Y5VPQI5mN3iiZc6Ek",
      },
    };

    const requestBody = {
      username: username,
      email: email,
      name: name,
      password: password,
    };

    axios
      .post(registerUrl, requestBody, requestConfig)
      .then((response) => {
        console.log(response);
        setMessage("Registration Successfull");
        history("/login");
      })
      .catch((error) => {
        if (error.response.status === 400) {
          console.log(error);
          setError(error.response.data.message);
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
          <label htmlFor="name">Name</label>
          <input
            name="name"
            label="name"
            type="name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div className="login-input-group">
          <label htmlFor="email">Email</label>
          <input
            name="email"
            label="email"
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
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
          Register
        </button>
      </form>
    </div>
  );
};

export default Register;
