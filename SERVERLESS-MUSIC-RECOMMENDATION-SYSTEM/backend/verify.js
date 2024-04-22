const util = require("./util");
const auth = require("./auth");

module.exports.verify = async (requestBody) => {
  if (!requestBody.user || !requestBody.username || !requestBody.token) {
    return util.buildResponse(401, {
      verified: false,
      message: "incorrect request body",
    });
  }
  const user = requestBody.user;
  const token = requestBody.token;
  const verification = auth.verifyToken(user.username, token);
  if (!verification.verified) {
    return util.buildResponse(401, verification);
  }

  return util.buildResponse(401, {
    verified: true,
    message: "success",
    user: user,
    token: token,
  });
};
