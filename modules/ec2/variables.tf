variable "project_name" {
  type = string
}

variable "ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "connected_to_rds_security_group_id" {
  type = string
}

variable "user_data_phase2" {
  type = string
}

variable "user_data_phase3" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}