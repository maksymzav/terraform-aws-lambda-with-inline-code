# Lambda Function with Inline Code

This module creates a Lambda function, as well as its IAM role and CloudWatch Logs group with inline code, i.e. the code of the Lambda function is uploaded by Terraform.

## Usage

```tf
module "lambda" {
  source  = "maksymzav/lambda-with-inline-code/aws"
  version = "~> 1.0"

  function_name = "example"
  description   = "This is an example"

  runtime                        = "nodejs18.x"
  handler                        = "index.handler"
  memory_size                    = 128
  timeout                        = 3
  reserved_concurrent_executions = 1
  publish                        = true

  environment_variables = {
    NODE_ENV = "production"
  }

  source_dir = "lambda/src"

  tags = {
    app = "example"
    env = "production"
  }
}
```
