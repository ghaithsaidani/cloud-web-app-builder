# virtual private cloud (vpc)
variable "project_name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}


# security groups
variable "web_app_sg_name" {
  type = string
}

variable "connected_to_rds_web_app_sg_name" {
  type = string
}

variable "db_sg_name" {
  type = string
}

variable "lb_sg_name" {
  type = string
}


# ec2 instances
variable "ami" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}



# rds database
variable "db_name" {
  type = string
}

variable "db_identifier" {
  type = string
} 

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

# cloud9
variable "cloud9_ec2_image_id" {
  type = string
}


# alb(application load balancer)
