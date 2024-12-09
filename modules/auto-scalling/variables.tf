variable "project_name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group" {
  type = string
}

/* variable "vpc_id" {
  type = string
} */

variable "iam_instance_profile" {
  type = string
}

variable "user_data" {
  type = string
}

variable "subnets" {
  type = set(string)
}

variable "target_group_arn" {
  type = string
}