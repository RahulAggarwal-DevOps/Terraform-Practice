output "my_Instances_IPs" {
	value = aws_instance.my_instance[*].public_ip
}
