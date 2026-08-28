resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("ec2-key.pub")
  tags = {
    Environment = var.env
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "example" {
  provider = aws    
  name = "${var.env}-infra-app-sg"
  vpc_id = aws_default_vpc.default.id

ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}

ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Custom open"
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all Outbound traffic"
}
tags = {
    Name = "${var.env}-infra-app-sg"
}
}

resource "aws_instance" "example" {
count = var.instance-count 
depends_on = [ aws_key_pair.my_key, aws_security_group.example]

 key_name = aws_key_pair.my_key.key_name
 security_groups = [ aws_security_group.example.name ]
 instance_type = var.instance-type
 ami = var.ami-id

 root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
 }
 tags = {
   Name = "${var.env}-infra-app-instance"
   Environment = var.env
 }
}
