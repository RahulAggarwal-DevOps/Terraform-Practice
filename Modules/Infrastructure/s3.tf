# Resource to create S3 bucket.
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "${var.my_env}-${var.my_s3_bucket_name}"

  tags = {
    Name        = "${var.my_env}-${var.my_s3_bucket_name}"
  }
}

