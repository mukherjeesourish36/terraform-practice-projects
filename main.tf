provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-081b0a6eac00b4f53"
  instance_type ="t3.small"
#   subnet_id = var.subnet_id_value
 tags = {
   Name = "sourish-ec2-1947"
   
 }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "sourish-bucket-1947"

}

resource "aws_dynamodb_table" "state_lock_table" {
  name           = "sourish-table-1947"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
