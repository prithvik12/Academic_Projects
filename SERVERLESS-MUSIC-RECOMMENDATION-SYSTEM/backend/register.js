const AWS = require("aws-sdk");
AWS.config.update({ region: "us-east-1" });
// sjdhf
const dynamodb = new AWS.DynamoDB.DocumentClient();
const userTable = "almusiqaa-users";
const util = require("./util");
const bcrypt = require("bcryptjs");

module.exports.register = async (userInfos) => {
  const userInfo = JSON.parse(userInfos.body);
  const name = userInfo.name;
  const email = userInfo.email;
  const username = userInfo.username;
  const password = userInfo.password;

  if (!name || !email || !username || !password) {
    return util.buildResponse(401, { message: "All fields are required" });
  }

  const dynamoUser = await getUser(username);
  if (dynamoUser && dynamoUser.username) {
    return util.buildResponse(401, { message: "user name already exsists" });
  }

  const encryptedPassword = bcrypt.hashSync(password.trim(), 10);
  const user = {
    name: name,
    email: email,
    username: username,
    password: encryptedPassword,
  };

  const saveUserResponse = await saveUser(user);
  if (!saveUserResponse) {
    return util.buildResponse(503, {
      message: "Server Error Please Try Again Later",
    });
  }

  return util.buildResponse(200, { username: username });
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

async function saveUser(user) {
  const params = {
    TableName: userTable,
    Item: user,
  };
  return await dynamodb
    .put(params)
    .promise()
    .then(
      (response) => {
        return true;
      },
      (error) => {
        console.error("Error ::: ", error);
      }
    );
}
