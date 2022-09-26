data "archive_file" "archive_lambda_file" {
  type             = "zip"
  source_file      = "${path.module}/send_email.js"
  output_file_mode = "0666"
  output_path      = "${path.module}/send_email.js.zip"
}


resource "aws_lambda_function" "stateFile_triger" {

  filename      = data.archive_file.archive_lambda_file.output_path
  function_name = "stateFile_triger"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"
  runtime = "nodejs12.x"
}