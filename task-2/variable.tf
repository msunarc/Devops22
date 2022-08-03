variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "cidr for VPC"
  type        = string
}
variable "public_subnet1_cidr" {
  default     = "10.0.0.0/24"
  description = "cidr for public-subnet1"
  type        = string
}
variable "public_subnet2_cidr" {
  default     = "10.0.1.0/24"
  description = "cidr for public-subnet2"
  type        = string
}
variable "private_subnet1_cidr" {
  default     = "10.0.2.0/24"
  description = "cidr for private-subnet1"
  type        = string
}
variable "private_subnet2_cidr" {
  default     = "10.0.8.0/24"
  description = "cidr for private-subnet2"
  type        = string
}
variable "private_subnet3_cidr" {
  default     = "10.0.4.0/24"
  description = "cidr for private-subnet3"
  type        = string
}
variable "private_subnet4_cidr" {
  default     = "10.0.5.0/24"
  description = "cidr for private-subnet4"
  type        = string
}

variable "SSh_location" {
  # in prod -use ur IP only
  default     = "0.0.0.0/0"
  description ="Cidr for bastion"
  type        = string
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami" {
    type = string
    default = "ami-0cff7528ff583bf9a"
}

# variable "DB_instance" {
#   default     = db.t2.micro
#   description ="Db instance type"
#   type        = string
# }

# variable "multi_az" {
#   default     = true
#   description ="Db instance type"
#   type        = boolean
# }
# variable "DB_instance_identifer" {
#   default     = db.t2.micro
#   # in desciption ,name=service_RDS_snapshot_getthe name below arn
#   description ="instance-identifier"
#   type        = string
# }
# variable "DB_snapshot_identifier" {
#   # Arn= from the service_RDS_snapshot_getthe existing_arn  default     = "arn.value"
#   default     = "ARN"
#   description ="database arn"
#   type        = string
# }
