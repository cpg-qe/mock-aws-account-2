terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Generate a random request ID
resource "random_integer" "req_id" {
  min = 1000000
  max = 9999999
}

# Generate a random email suffix
resource "random_string" "email_suffix" {
  length  = 6
  special = false
  upper   = false
}

# Create AWS Organizations Account
resource "aws_organizations_account" "account" {
  name  = "${var.account_name_prefix}${random_integer.req_id.result}-sales-finance-camapp"
  email = "itom-aws-cafa+CAMSAREQ${random_integer.req_id.result}-${random_string.email_suffix.result}@${var.email_domain}"

  parent_id       = var.parent_ou_id
  close_on_deletion = true
  create_govcloud = false

  tags = {
    business_application      = "CAM APP"
    business_unit             = var.business_unit
    cost_center               = var.cost_center
    cost_center_account_number = "ACN${random_integer.req_id.result}"
    department                = "Customer Support"
    environment               = "Development"
  }
}

output "aws_organizations_account" {
  value = {
    id               = aws_organizations_account.account.id
    arn              = aws_organizations_account.account.arn
    email            = aws_organizations_account.account.email
    name             = aws_organizations_account.account.name
    parent_id        = aws_organizations_account.account.parent_id
    status           = aws_organizations_account.account.status
    tags             = aws_organizations_account.account.tags
  }
}
