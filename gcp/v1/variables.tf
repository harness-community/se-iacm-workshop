//Define Valid Variables
variable "extra" {
  type    = string
  default = "I am from the git repo."
}

variable "instance_type" {
  type = string
}

variable "resource_owner" {
  type    = string
  default = "test"
}

// GCP Environment
variable "gcp_project_id" {
  type = string
}
