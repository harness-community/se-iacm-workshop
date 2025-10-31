//Define Valid Variables
variable "extra" {
  type    = string
  default = "I am from the git repo."
}

variable "extra1" {
  type    = string
  default = "I am from the git repo."
}

variable "instance_type" {
  type = string
}

variable "vpc_security_group_id" {
  type = string
  default = ""
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}
