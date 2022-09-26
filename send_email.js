var aws = require("aws-sdk");
var ses = new aws.SES({ region: "us-west-2" });
exports.handler = async function (event) {
  var params = {
    Destination: {
      ToAddresses: ["RecipientEmailAddress", ...],
    },
    Message: {
      Body: {
        Text: { Data: "This is a test email from Ahmed Magdy" },
      },

      Subject: { Data: "Test Email" },
    },
    Source: "SourceEmailAddress",
  };
 
  return ses.sendEmail(params).promise()
};