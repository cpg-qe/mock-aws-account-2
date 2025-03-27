resource "random_integer" "aws_account_id" {
  min = 100000000000
  max = 999999999999
}

resource "null_resource" "mock_account" {
  triggers = {
    id        = tostring(random_integer.aws_account_id.result)
    arn       = "arn:aws:organizations::mock:account/o-mock/${random_integer.aws_account_id.result}"
    name      = "camsareq${random_integer.aws_account_id.result}-sales-finance-camapp"
    email     = "itom-aws-cafa+CAMSAREQ${random_integer.aws_account_id.result}-test@servicenow.com"
    parent_id = "ou-k7qu-rvmu2ynq"
    status    = "MOCK_ACTIVE"
  }
}
