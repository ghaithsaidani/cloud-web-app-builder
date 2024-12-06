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
  connected_to_rds_web_app_sg_name = var.connected_to_rds_web_app_sg_name
  db_sg_name = var.db_sg_name
  lb_sg_name = var.lb_sg_name
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  project_name = var.project_name
  security_group_id = module.sg.web_app_sg_id
  connected_to_rds_security_group_id = module.sg.connected_to_rds_web_app_sg_id
  subnet_id = module.vpc.subnet_id
  user_data_phase2 = data.template_file.user_data_phase2.rendered
  user_data_phase3 = data.template_file.user_data_phase3.rendered
  iam_instance_profile = var.iam_instance_profile
}

module "rds" {
  source = "./modules/rds"
  db_name = var.db_name
  project_name = var.project_name
  db_identifier = var.db_identifier
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = module.vpc.private_subnet_ids
  security_group_id = module.sg.db_sg_id
}

module "cloud9" {
  source = "./modules/cloud9"
  cloud9_ec2_image_id = var.cloud9_ec2_image_id
  project_name = var.project_name
  subnet_id = module.vpc.subnet_id
}


module "alb" {
  source = "./modules/alb"
  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  instance_id = module.ec2.instance_id
  security_group = module.sg.lb_sg_id
  subnets = module.vpc.public_subnet_ids
}