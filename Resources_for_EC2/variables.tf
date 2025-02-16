variable "my_ec2_ami_id" {
        default = "ami-0cb91c7de36eed2cb"
        type = string
        description = "This is the AMI (Amazon Machine Image of my instances"
}

variable "my_ec2_instance_type" {
        default = "t2.micro"
        type = string
        description = "This is the instance type for my EC2 instances"
}

variable "my_ec2_count" {
        default = 2
        type = number
        description = "This the instances count"
}

variable "my_ec2_key_name" {
        default = "TWS_Devops_KeyPair"
        type = string
        description = "This is the KeyPair for my instances"
}

variable "my_ec2_instance_name" {
        default = "TF-Instance"
        type = string
        description = "This is the name of my instances created through terraform script"
}

variable "my_sg_name" {
        default = "TF-SG"
        type = string
        description = "This is the name of my security group created through terraform script"
}
