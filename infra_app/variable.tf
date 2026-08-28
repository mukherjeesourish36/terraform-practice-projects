variable "env" {
    description = "This is a variable of environment for infra"
    type = string
  
}

variable "bucket-name" {
    description = "This is a variable for bucket name in infra"
    type = string
}

variable "instance-count" {
description = "This is counting no of ec2 instances in infra"
    type = number
}

variable "instance-type" {
description = "This denotes the type of ec2 instances in infra"
    type = string
}

variable "ami-id" {
    description = "This denotes the ami id of ec2 instances in infra"
    type = string
}

variable "hash_key" {
description = "This provides the hash key for dynamodb in infra"
    type = string
}