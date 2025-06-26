// Define Valid Variables
variable "extra" {
  type    = string
  default = "I am from the git repo."
}

variable "extra1" {
  type    = string
  default = "I am from the git repo."
}

variable "instance_type" {
  type    = string
  default = "Standard_B2s" # Azure VM size equivalent to a small AWS instance
}

variable "tags" {
  description = "Tags to set on resources."
  type        = map(string)
  default     = {}
}
