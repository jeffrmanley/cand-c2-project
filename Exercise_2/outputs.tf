# TODO: Define the output variable for the lambda function.

output "function_name" {
  description = "The name of the Udacity Lambda function"
  value       = aws_lambda_function.test_lambda_2
}

