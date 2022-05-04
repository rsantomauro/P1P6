resource "aws_secretsmanager_secret" "MySQL-User" {
  name = "MySQL-User"
}

data "aws_secretsmanager_secret" "MySQL-User" {
  # name = "MySQL-User"
  arn = aws_secretsmanager_secret.MySQL-User.arn
}

# vault hashicorp