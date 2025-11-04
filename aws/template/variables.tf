//Define Valid Variables
variable "bucket_name" {
  type = string
}

variable "enable_bucket_logging" {
  type        = bool
  default     = false
  description = "Enable access logging for the S3 bucket"
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}
