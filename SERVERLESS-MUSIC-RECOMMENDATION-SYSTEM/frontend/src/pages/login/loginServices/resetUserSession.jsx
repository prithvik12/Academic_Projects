const resetUserSession= () =>{
    sessionStorage.removeItem("user");
    sessionStorage.removeItem("token");
  }

  export default resetUserSession