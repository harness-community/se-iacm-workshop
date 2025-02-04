//Define Valid Variables
variable "extra" {
  type    = string
  default = "I am from the git repo."
}

variable "instance_type" {
  type = string
}

variable "resource_owner" {
  type = string
}

// GCP Environment
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}
