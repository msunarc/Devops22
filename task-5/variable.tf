variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 8080, 8081, 9000]
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "ami" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}
variable "cidr_block" {
  type    = list(string)
  default = ["10.0.0.0/16", "10.0.1.0/24"]
}