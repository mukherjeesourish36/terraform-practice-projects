terraform {
  backend "s3" {
    bucket = "sourish-bucket-1947"
    key    = "sourish/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "sourish-table-1947"
  }
}
