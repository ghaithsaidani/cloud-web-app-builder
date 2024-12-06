variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "security_group" {
  type = string
}

variable "subnets" {
  type = set(string)
}