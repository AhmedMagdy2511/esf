resource "aws_s3control_object_lambda_access_point_policy" "example" {
  name = aws_s3control_object_lambda_access_point.example.name

  policy = jsonencode([{
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:*",
          "s3-object-lambda:*"
        ],
        Principal = {
          AWS = {
            region = "eu-west-3"
          }
        }
        # Resource = aws_s3control_object_lambda_access_point.example.arn
        Resource = "*"
    }]
    },
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "s3-object-lambda:WriteGetObjectResponse"
          ],
          Principal = {
            AWS = {
              region = "eu-west-3"
            }
          }
          Resource = "*"
        }
      ]
  }])
}

resource "aws_s3control_object_lambda_access_point" "example" {
  name = "example"

  configuration {
    supporting_access_point = "arn:aws:s3:::terraform-backend-devops-iti"

    transformation_configuration {
      actions = ["*"]

      content_transformation {
        aws_lambda {
          function_arn = aws_lambda_function.stateFile_triger.arn
        }
      }
    }
  }
}