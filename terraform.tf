terraform{
required_providers{
aws = {
 source = "hashicorp/aws"
 version = "~>6.0"
   }
 }

backend "s3" {
  bucket = "terra-bucket-180826"
  key = "terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "my-tf-test-database"
}


}