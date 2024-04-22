const getToken= () =>{
    console.log(sessionStorage.getItem("token"));
    return sessionStorage.getItem("token");
  }

  export default getToken