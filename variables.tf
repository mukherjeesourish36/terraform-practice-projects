variable "ec2-instance-type"{
    default = "t3.micro"
    type = string
}

variable "ec2-default-root-storage-size" {
  default = 15
  type = number
}

variable "ec2-ami-id"{
    default = "ami-00adafae70b8029d8"
    type = string
}

variable "env" {
  default = "prd"
  type = string
}