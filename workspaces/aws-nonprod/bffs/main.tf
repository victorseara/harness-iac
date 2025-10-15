terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # TODO: Replace with your desired AWS region
}

# Before applying this configuration, ensure you have a zip file
# containing your lambda function code at the path specified in `source_path`.
# For example, you can create a zip from the `src` directory:
# zip -j fastify-lambda.zip src/index.js

module "fastify_lambda_bff" {
  source = "../../../modules/bff"

  function_name = "fastify-lambda"
  handler       = "index.handler"
  runtime       = "nodejs22.x"
  source_path   = "../../../lambda-placeholder/placeholder.zip"

  # When sourcing from S3, provide the bucket and key.
  # The CI/CD pipeline of your application should upload the zip artifact to this location.
  # s3_bucket = "your-lambda-artifacts-bucket" # TODO: Replace with your bucket name
  # s3_key    = "fastify-lambda/latest.zip"    # TODO: Replace with your object key
}

output "fastify_lambda_invoke_url" {
  description = "Invoke URL for the fastify-lambda BFF"
  value       = module.fastify_lambda_bff.invoke_url
}