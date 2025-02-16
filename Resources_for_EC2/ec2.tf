# Resource block for default VPC.
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Resource block for security group.
resource "aws_security_group" "my_security_grp" {
  name        = var.my_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = var.my_sg_name
  }

/*

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "This is the inbound rule for allowing ssh communication from outside"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "This is the outbound rule for allowing all outside communication"
  }

# Avoid using the ingress and egress arguments of the aws_security_group resource to configure in-line rules, as they struggle with managing multiple CIDR blocks, due to the historical lack of unique IDs, tags and descriptions. Instead use aws_vpc_security_group_ingress_rule and aws_vpc_security_group_egress_rule resources, as below.

*/

}

# Resource block for inbound rules in SG.
resource "aws_vpc_security_group_ingress_rule" "my_sg_ingress_rules" {
  security_group_id = aws_security_group.my_security_grp.id
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Resource block for outbound rules in SG.
/* AWS allows outbound to all ports by-default. But, when created via terraform script, outbound rules are not allowing to connect to all ports. So, we need to give egress rule manually, as below. */
resource "aws_vpc_security_group_egress_rule" "my_sg_egress_rules" {
  security_group_id = aws_security_group.my_security_grp.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Resource block for my ec2 instance.
resource "aws_instance" "my_instance" {
  ami           = var.my_ec2_ami_id
  instance_type = var.my_ec2_instance_type
  count = var.my_ec2_count
  key_name = var.my_ec2_key_name
  security_groups = [aws_security_group.my_security_grp.name]

  tags = {
    Name = var.my_ec2_instance_name
  }  
}

# Resource block to assign running state to all my ec2 instances. 
resource "aws_ec2_instance_state" "my_instance_state" {
  count = length(aws_instance.my_instance)
  instance_id = element(aws_instance.my_instance.*.id, count.index)
  state       = "running"
}
