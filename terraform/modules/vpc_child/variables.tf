variable "environment_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "subnet_newbits" {
  type    = number
  default = 8
}
variable "tags" {
  type    = map(string)
  default = {}
}
