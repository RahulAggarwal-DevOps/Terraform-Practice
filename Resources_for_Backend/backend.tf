# Resource to create S3 bucket.
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.my_s3_bucket_name

  tags = {
    Name        = var.my_s3_bucket_name
  }
}

# Resource to create a dynamodb table.
resource "aws_dynamodb_table" "my_dynamodb_table" {
  name             = var.my_dynamodb_table_name
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = var.my_dynamodb_table_name
  }
}
