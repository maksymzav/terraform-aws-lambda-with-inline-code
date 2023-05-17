provider "aws" {
  region = "eu-west-3"
}

module "lambda" {
  source  = "./.."

  function_name = "maksymzav-lambda-example"
  description   = "This is an example"

  runtime                        = "nodejs16.x"
  handler                        = "index.handler"
  memory_size                    = 128
  timeout                        = 3
  reserved_concurrent_executions = 0
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
