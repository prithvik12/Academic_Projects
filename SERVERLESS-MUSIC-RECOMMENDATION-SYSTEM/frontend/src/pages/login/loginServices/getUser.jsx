

 const  getUser=  () =>{
    const user = sessionStorage.getItem("user");
    if (user === "undefined" || !user) {
      return null;
    } else {
      return JSON.parse(user);
    }
  }
  export default getUser
