# ...

# AWS Lambda function
resource "aws_lambda_function" "s3_event_lambda" {
  function_name = "s3EventLambda"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "path/to/your/lambda_function.zip"  # Update with your Lambda function code

  environment = {
    variables = {
      # Add any environment variables needed by your Lambda function
      EXAMPLE_VARIABLE = "example_value",
    }
  }

  # Trigger the Lambda function on S3 bucket event
  event_source {
    s3_bucket = aws_s3_bucket.website_bucket.bucket
    events    = ["s3:ObjectCreated:*"]
  }
}

# Output the Lambda function ARN
output "lambda_function_arn" {
  value = aws_lambda_function.s3_event_lambda.arn
}
