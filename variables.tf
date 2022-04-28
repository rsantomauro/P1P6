variable "cidr_block" {
    default = "172.16"
}

variable "userMySQL" {
    default = "user"
}

resource "random_password" "user_pass_MySQL" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}