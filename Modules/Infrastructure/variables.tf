variable "my_env" {
	type = string
	description = "This defines my environment (dev/testing/prod)."
}

variable "my_s3_bucket_name" {
        type = string
        description = "This is the name of my S3 bucket created via TF script."
}

variable "my_dynamodb_table_name" {
        type = string
        description = "This is the name of my DynamoDB table created via TF script."
}

variable "my_ec2_ami_id" {
        type = string
        description = "This is the AMI (Amazon Machine Image of my instances"
}

variable "my_ec2_instance_type" {
        type = string
        description = "This is the instance type for my EC2 instances"
}

variable "my_ec2_count" {
        type = number
        description = "This the instances count"
}

variable "my_ec2_key_name" {
        type = string
        description = "This is the KeyPair for my instances"
}

variable "my_ec2_instance_name" {
        type = string
        description = "This is the name of my instances created through terraform script"
}

variable "my_sg_name" {
        type = string
        description = "This is the name of my security group created through terraform script"
}
