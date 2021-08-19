resource "aws_cloud9_environment_ec2" "dev_env" {
  instance_type = "t2.micro"
  name          = var.component_name
}