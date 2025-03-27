terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  # Uncomment and configure if using actual AWS credentials
  # access_key = "your-access-key"
  # secret_key = "your-secret-key"
}

# Mock AWS Account Data
resource "null_resource" "mock_aws_account" {
  triggers = {
    id = "123456789012"
    account_name = "mock-account"
    organization_id = "o-abcdefghij"
  }
}

# Output Mock AWS Account Data
output "aws_account_details" {
  value = {
    id      = null_resource.mock_aws_account.triggers["id"]
    account_name    = null_resource.mock_aws_account.triggers["account_name"]
    organization_id = null_resource.mock_aws_account.triggers["organization_id"]
  }
}
