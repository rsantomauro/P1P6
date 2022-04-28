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
    username            = "user"
    port                = "3306"
    create_random_password = "true"
    random_password_length = 12
    iam_database_authentication_enabled = true

    vpc_security_group_ids = [aws_security_group.P1P6-Interno.id]
    tags = {
        Owner       = "user"
        Environment = "dev"
    }
}

# genera clave random como la obtemos?