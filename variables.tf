variable "account_name_prefix" {
  description = "Prefix for the AWS account name"
  type        = string
  default     = "camsareq"
}

variable "cost_center" {
  description = "Cost center for tagging"
  type        = string
  default     = "Sales"
}

variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "Finance"
}

variable "email_domain" {
  description = "Email domain for new AWS accounts"
  type        = string
  default     = "servicenow.com"
}

variable "parent_ou_id" {
  description = "Parent Organizational Unit ID"
  type        = string
  default     = "ou-k7qu-rvmu2ynq"
}
