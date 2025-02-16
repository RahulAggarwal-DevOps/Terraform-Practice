variable "my_s3_bucket_name" {
	default = "tf-s3-bucket-r"
	type = string
	description = "This is the name of my S3 bucket created via TF script."
}

variable "my_dynamodb_table_name" {
        default = "tf-dynamodb-table"
        type = string
        description = "This is the name of my DynamoDB table created via TF script."
}
