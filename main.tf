resource "random_integer" "req_id" {
  min = 1000000
  max = 9999999
}

resource "null_resource" "mock_account" {
  triggers = {
    id        = "mock-${random_integer.req_id.result}"
    arn       = "arn:aws:organizations::mock:account/o-mock/${random_integer.req_id.result}"
    name      = "camsareq${random_integer.req_id.result}-sales-finance-camapp"
    email     = "itom-aws-cafa+CAMSAREQ${random_integer.req_id.result}-test@servicenow.com"
    parent_id = "ou-k7qu-rvmu2ynq"
    status    = "MOCK_ACTIVE"
  }
}

output "mock_aws_account" {
  value = {
    id        = null_resource.mock_account.triggers.id
    arn       = null_resource.mock_account.triggers.arn
    email     = null_resource.mock_account.triggers.email
    name      = null_resource.mock_account.triggers.name
    parent_id = null_resource.mock_account.triggers.parent_id
    status    = null_resource.mock_account.triggers.status
  }
}
