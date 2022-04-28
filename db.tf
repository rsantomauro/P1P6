module "db" {
    source = "terraform-aws-modules/rds/aws"
    option_group_use_name_prefix = false

    identifier          = "p1p6-db"
    engine              = "mysql"
    engine_version      = "5.7.37"
    major_engine_version = "5.7"
    family = "mysql5.7"
    instance_class      = "db.t3.micro"
    allocated_storage   = 5

    db_name             = "p1p6-wp"
    username            = "${var.userMySQL}"
    port                = "3306"
    depends_on = [
      random_password.user_pass_MySQL
    ]
    password            = "${var.user_pass_MySQL}"
    iam_database_authentication_enabled = true

    vpc_security_group_ids = [aws_security_group.P1P6-Interno.id]
    tags = {
        Owner       = "${var.userMySQL}"
        Environment = "dev"
    }
}

# genera clave random como la obtemos?