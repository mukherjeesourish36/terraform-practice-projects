provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module/ec2_instance"
  ami_value = "ami-081b0a6eac00b4f53"
  instance_type_value = "t3.micro"

}