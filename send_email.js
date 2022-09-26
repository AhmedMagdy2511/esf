var aws = require("aws-sdk");
var ses = new aws.SES({ region: "us-east-1" });
exports.handler = async function (event) {
  var params = {
    Destination: {
      ToAddresses: ["elmar7om123@gmail.com"],
    },
    Message: {
      Body: {
        Text: { Data: "This is a test email from Ahmed Magdy" },
      },

      Subject: { Data: "Test Email" },
    },
    Source: "a7mad7mada102@gmail.com",
  };
 
  return ses.sendEmail(params).promise()
};