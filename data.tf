data "template_file" "user_data_phase2" {
  template = file("${path.module}/scripts/UserdataScript-phase-2.sh")
}

data "template_file" "user_data_phase3" {
  template = file("${path.module}/scripts/UserdataScript-phase-3.sh")
}