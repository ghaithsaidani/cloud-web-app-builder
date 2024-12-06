data "template_file" "user_data" {
  template = file("${path.module}/scripts/UserdataScript-phase-2.sh")
}