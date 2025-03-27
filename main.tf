terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "camautoorg"

    workspaces {
      name = "camsareq0000006-camsaexe0000007-sales-finance"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_account" "account" {
  name              = "camsareq0000006-sales-finance-camapp"
  email             = "itom-aws-cafa+CAMSAREQ0000006-CH0mRyuL@servicenow.com"
  parent_id         = "ou-k7qu-rvmu2ynq"
  close_on_deletion = true
  create_govcloud   = false

  tags = {
    business_application      = "CAM APP"
    business_unit             = "Finance"
    cost_center               = "Sales"
    cost_center_account_number = "ACN00007"
    department                = "Customer Support"
    environment               = "Development"
  }
}
