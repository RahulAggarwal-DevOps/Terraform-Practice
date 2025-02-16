# Terraform modules

Modules are containers for multiple resources that are used together. Modules are the main way to package and reuse resource configurations with Terraform.

In this directory, the infrastructure to create ec2 instances, s3 bucket and dynamodb table is stored in the Infrastructure folder. All variables are contained inside variables.tf in the Infrastructure folder.
You can see modules.tf file above, which has modules for development, testing and production. 
Simply run "terraform init", "terraform plan" and "terraform apply" to apply the modules.
