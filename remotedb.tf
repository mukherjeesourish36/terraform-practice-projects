resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "my-tf-test-database"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

    tags = {
    Name  = "my-tf-test-database"
  }
}