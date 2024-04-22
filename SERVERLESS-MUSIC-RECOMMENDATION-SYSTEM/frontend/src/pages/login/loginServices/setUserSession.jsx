const setUserSession= (user, token) =>{
    sessionStorage.setItem("user", JSON.stringify(user));
    sessionStorage.setItem("token", token);
  }

export default setUserSession