resource "aws_s3_bucket" "example" {
  bucket = "terra-bucket-180826"

  tags = {
    Name = "terra-bucket-180826"
  }
}