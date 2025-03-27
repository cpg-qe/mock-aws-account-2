resource "random_integer" "aws_account_id" {
  min = 100000000000
  max = 999999999999
}

resource "local_file" "mock_state" {
  filename = "${path.module}/mock_state.json"
  content  = jsonencode({
    version           = 4
    terraform_version = "1.11.2"
    serial            = 1
    lineage           = "mocked-lineage-xxxxxx"
    outputs          = {}
    resources        = [
      {
        mode      = "managed"
        type      = "aws_organizations_account"
        name      = "account"
        provider  = "provider[\"registry.terraform.io/hashicorp/aws\"]"
        instances = [
          {
            schema_version = 0
            attributes = {
              arn                        = "arn:aws:organizations::mock:account/o-mock/${random_integer.aws_account_id.result}"
              close_on_deletion          = true
              create_govcloud            = false
              email                      = "itom-aws-cafa+CAMSAREQ${random_integer.aws_account_id.result}-test@servicenow.com"
              govcloud_id                = ""
              iam_user_access_to_billing = null
              id                         = tostring(random_integer.aws_account_id.result)
              joined_method              = "CREATED"
              joined_timestamp           = "2025-03-25T07:28:39Z"
              name                       = "camsareq${random_integer.aws_account_id.result}-sales-finance-camapp"
              parent_id                  = "ou-k7qu-rvmu2ynq"
              role_name                  = null
              status                     = "MOCK_ACTIVE"
              tags = {
                business_application      = "CAM APP"
                business_unit             = "Finance"
                cost_center               = "Sales"
                cost_center_account_number = "ACN00007"
                department                = "Customer Support"
                environment               = "Development"
              }
              tags_all = {
                business_application      = "CAM APP"
                business_unit             = "Finance"
                cost_center               = "Sales"
                cost_center_account_number = "ACN00007"
                department                = "Customer Support"
                environment               = "Development"
              }
              timeouts = null
            }
            sensitive_attributes = []
            private               = "xxxx"
          }
        ]
      }
    ]
    check_results = null
  })
}
