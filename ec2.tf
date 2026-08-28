resource "aws_key_pair" "my_key" {
  key_name   = "ec2-key"
  public_key = file("ec2-key.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "example" {
  provider = aws    
  name = "default-sg"
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
}

resource "aws_instance" "example" {
 for_each = tomap (
  {
    ec2-micro = "t3.micro"
    ec2-small = "t3.small"
  
  }
 ) 
depends_on = [ aws_key_pair.my_key, aws_security_group.example]

 key_name = aws_key_pair.my_key.key_name
 security_groups = [ aws_security_group.example.name ]
 instance_type = each.value
 ami = var.ec2-ami-id

 root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2-default-root-storage-size
    volume_type = "gp3"
 }
 tags = {
   Name = each.key
   Environment = var.env
 }
}
