//Output After Run
output "vpc_arn" {
  description = "VPN ARN"
  value       = aws_vpc.main.arn
  sensitive   = true
}

output "vpc_id" {
  description = "VPN id"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Subnet ARN"
  value       = aws_subnet.main.id
}

output "ips" {
  description = "VM private IP"
  value = {
    for instance in aws_instance.ec2-be :
    instance.tags.name => instance.private_ip
  }
}
