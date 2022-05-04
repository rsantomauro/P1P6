# Red publica

resource "aws_instance" "P1P6-NGINX1" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = [aws_security_group.P1P6-SG-WEB.id]
  subnet_id = aws_subnet.P1P6-az1.id
  tags = {
    Name      = "P1P6-NGINX1"
    terraform = "True"
  }
}

resource "aws_instance" "P1P6-NGINX2" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = [aws_security_group.P1P6-SG-WEB.id]
  subnet_id = aws_subnet.P1P6-az1.id
  tags = {
    Name      = "P1P6-NGINX2"
    terraform = "True"
  }
}

# Red interna
resource "aws_instance" "P1P6-Wordpress" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  key_name      = "vockey"
  vpc_security_group_ids = [aws_security_group.P1P6-Interno.id]
  subnet_id = aws_subnet.P1P6-az1.id
  tags = {
    Name      = "P1P6-Wordpress"
    terraform = "True"
  }
}