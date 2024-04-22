module.exports = {
  getUser: async () =>{
    const user = sessionStorage.getItem("user");
    if (user === "undefined" || !user) {
      return null;
    } else {
      return JSON.parse(user);
    }
  },

  getToken: async () =>{
    console.log(sessionStorage.getItem("token"));
    return sessionStorage.getItem("token");
  },

  setUserSession: async (user, token) =>{
    sessionStorage.setItem("user", JSON.stringify(user));
    sessionStorage.setItem("token", token);
  },
  resetUserSession: async () =>{
    sessionStorage.removeItem("user");
    sessionStorage.removeItem("token");
  },
};
