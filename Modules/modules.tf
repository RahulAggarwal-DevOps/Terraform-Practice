module "Development" {
	source = "./Infrastructure"
	my_env = "dev"
	my_ec2_ami_id = "ami-0cb91c7de36eed2cb"
	my_ec2_instance_type = "t2.micro"
	my_ec2_count = 1
	my_ec2_key_name = "TWS_Devops_KeyPair"
	my_ec2_instance_name = "TF-Instance"
	my_sg_name = "TF-SG"
	my_s3_bucket_name = "tf-s3-bucket-r"
	my_dynamodb_table_name = "tf-dynamodb-table"
}

module "Testing" {
        source = "./Infrastructure"
	my_env = "test"
        my_ec2_ami_id = "ami-0cb91c7de36eed2cb"
        my_ec2_instance_type = "t2.micro"
        my_ec2_count = 1
        my_ec2_key_name = "TWS_Devops_KeyPair"
        my_ec2_instance_name = "TF-Instance"
        my_sg_name = "TF-SG"
        my_s3_bucket_name = "tf-s3-bucket-r"
        my_dynamodb_table_name = "tf-dynamodb-table"
}

module "Production" {
        source = "./Infrastructure"
	my_env = "prod"
        my_ec2_ami_id = "ami-0cb91c7de36eed2cb"
        my_ec2_instance_type = "t2.micro"
        my_ec2_count = 1
        my_ec2_key_name = "TWS_Devops_KeyPair"
        my_ec2_instance_name = "TF-Instance"
        my_sg_name = "TF-SG"
        my_s3_bucket_name = "tf-s3-bucket-r"
        my_dynamodb_table_name = "tf-dynamodb-table"
}
