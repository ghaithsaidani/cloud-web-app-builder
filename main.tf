module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  region = var.region
  project_name = var.project_name
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}

module "sg" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  web_app_sg_name = var.web_app_sg_name
  db_sg_name = var.db_sg_name
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  project_name = var.project_name
  security_group_id = module.sg.web_app_sg_id
  subnet_id = module.vpc.subnet_id
  user_data = data.template_file.user_data.rendered
}

module "rds" {
  source = "./modules/rds"
  db_name = var.db_name
  //db_identifier = var.db_identifier
  db_username = var.db_username
  db_password = var.db_password
}

module "cloud9" {
  source = "./modules/cloud9"
  cloud9_ec2_image_id = var.cloud9_ec2_image_id
  project_name = var.project_name
}