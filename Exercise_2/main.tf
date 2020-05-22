
provider "aws" {
  region          = var.aws_region
  profile		  = "jeffrmanleynet"
}

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "greet_lambda.py"
    output_path   = "greet_lambda.zip"
}

resource "aws_lambda_function" "test_lambda_2" {
  filename         = "greet_lambda.zip"
  function_name    = "lambda_handler"
  role             = aws_iam_role.iam_for_lambda_tf.arn
  handler          = "greet_lambda.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.6"
}

resource "aws_iam_role" "iam_for_lambda_tf" {
  name = "iam_for_lambda_tf"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}