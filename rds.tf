resource "aws_db_subnet_group" "main" {
  name = "full-stack-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "Full-Stack-RDS-Subnet-Group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "full-stack-postgres"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "fullstackdb"
  username = var.db_username
  password = var.db_password

  port = 5432

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false

  storage_encrypted = true

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true

  tags = {
    Name = "Full-Stack-PostgreSQL"
  }
}
