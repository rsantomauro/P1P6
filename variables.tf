variable "cidr_block" {
    default = "172.16"
}

variable "userMySQL" {
    default = "user"
}

//variable "ssh_key" {
//    default = "/home/rsantomauro/vockey.pem"
//}

resource "random_password" "user_pass_MySQL" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "user_pass_MySQL" {
#  default = random_password.user_pass_MySQL.result
  default = "prueba"
}

//resource "aws_key_pair" "keypair1" {
//  key_name   = "vockey"
//  public_key = file(var.ssh_key)
// }