# Terraform Remote Backends and State Locking :

This repo uses Terraform to manage Infrastructure as Code. 

Resources_for_EC2 folder has ec2.tf file, which creates a default VPC, security group, egress and ingress rules, and ec2 state resources. Variables.tf file contains all the default values for variables used. Outputs.tf file prints the IPs of all EC2 instances. for_each and count is used in aws ec2 state resource to keep each ec2 instance running. Terraform.tf file has a backend sub-block, to upload terraform state file to an S3 bucket already created. State locking of this terraform.tfstate file is implemented using lockID generated in dynamodb table.

Both S3 bucket and Dynamodb Table forms the remote backend. Backend is provisioned in another foleder named Resources_for_Backend. backend.tf file provisions s3 bucket and dynamodb table. Variables.tf contains default values of all variables.

# Steps to implement remove backend and state locking :

1. Create an IAM user, allocate administrative permissions to it, and run "aws configure" on the host.
2. Run "terraform init" inside Resources_for_Backend folder, followed by "terraform plan" and "terraform apply". This will create S3 bucket and DynamoDB table in your AWS account. Kindly confirm.
3. Inside Resources_for_EC2 folder, go inside terraform.tf file and comment dynamodb_table from backend sub-block. Run "terraform init". This will initialize the state file terraform.tfstate to be stored in the S3 bucket. Kindly confirm.
4. Once step 3 finishes, uncomment dynamodb_table from backend sub-block in terraform.tf file, and again run "terraform init -migrate-state". This will enable state locking on terraform.tf file in s3 bucket. Now run "terraform plan" and "terraform apply". This will create deafult VPC (already available in all regions anyways), security groups, ingress and egress rules for security group in your AWS account.
5. When "terraform apply" is running, open another tab, go inside Resources_for_EC2 folder, edit count of ec2 instances in variables.tf file, and run "terraform apply". You will notice that terraform will give state locking error, since "terraform apply" is already provisioning the infrastructure in the first tab. Once that is finished, you can now run "terraform apply" in another tab successfully.

**ENJOY !!!**

