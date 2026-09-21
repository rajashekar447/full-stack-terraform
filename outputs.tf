output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "ec2_public_ip" {
  description = "Public IP of Full Stack EC2"
  value       = aws_instance.app.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of Full Stack EC2"
  value       = aws_instance.app.public_dns
}

output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = aws_db_instance.postgres.address
}

output "rds_port" {
  description = "RDS PostgreSQL port"
  value       = aws_db_instance.postgres.port
}
