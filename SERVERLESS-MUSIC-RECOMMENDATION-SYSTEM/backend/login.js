const AWS = require("aws-sdk");
const bcrypt = require("bcryptjs/dist/bcrypt");
const auth = require("./auth");
const util = require("./util");
AWS.config.update({ region: "us-east-1" });

const dynamodb = new AWS.DynamoDB.DocumentClient();
const userTable = "almusiqaa-users";

module.exports.login = async (users) => {
  const user = JSON.parse(users.body);
  const username = user.username;
  const password = user.password;

  if (!user || !username || !password) {
    return util.buildResponse(401, { message: "All fields are required" });
  }

  const dynamoUser = await getUser(username);
  if (!dynamoUser || !dynamoUser.username) {
    return util.buildResponse(403, { message: "user does not exists" });
  }

  if (!bcrypt.compareSync(password, dynamoUser.password)) {
    return util.buildResponse(403, { message: "password is incorrecr" });
  }

  const userInfo = {
    username: dynamoUser.username,
    name: dynamoUser.name,
  };
  const token = auth.generateToken(userInfo);
  const response = {
    user: userInfo,
    token: token,
  };
  return util.buildResponse(200, response);
};

async function getUser(username) {
  const params = {
    TableName: userTable,
    Key: {
      username: username,
    },
  };
  return await dynamodb
    .get(params)
    .promise()
    .then(
      (response) => {
        return response.Item;
      },
      (error) => {
        console.error("Error ::: ", error);
      }
    );
}
