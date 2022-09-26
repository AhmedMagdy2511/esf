# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "lambda.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

resource "aws_iam_role" "role_lambda" {
  name = "role_lambda"

    assume_role_policy = data.aws_iam_policy.JSON
}

resource "aws_iam_policy" "sendEmail_policy" {
  name        = "sendEmail_policy"
  path        = "/"
  description = "send email policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${path.module}lambdaRole.json"
}