const jwt = require("jsonwebtoken");

module.exports.generateToken = (userInfo) => {
  if (!userInfo) {
    return null;
  }
  const authToken = jwt.sign(userInfo, "almusiqaa", { expiresIn: "1h" });
  console.log("auth :::" + authToken);
  return authToken;
};
