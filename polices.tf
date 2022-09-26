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

# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"
#   assume_role_policy = "${file("lambda/assume_role_policy.json")}"
# }


resource "aws_iam_role" "role_lambda" {
  name = "role_lambda"

  assume_role_policy = "${file("${path.module}/lambdaRole.json")}"
}


resource "aws_iam_role_policy" "sendEmail_policy" {
  name        = "sendEmail_policy"
  #path        = "/"
  #description = "send email policy"
   role   = aws_iam_role.role_lambda.id 
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("${path.module}/mailRole.json")}"
}

# resource "aws_iam_role_policy" "lambda_policy" {
#   name   = "lambda_policy"
#   role   = aws_iam_role.iam_for_lambda.id
#   policy = "${file("lambda/policy.json")}"
# }