# Resource to create a dynamodb table.
resource "aws_dynamodb_table" "my_dynamodb_table" {
  name             = "${var.my_env}-${var.my_dynamodb_table_name}"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "${var.my_env}-${var.my_dynamodb_table_name}"
  }
}

