variable "vpc_cidr" {
  description = "Choose cidr for vpc"
  type        = string
  default     = "10.20.0.0/16"
}

variable "region" {
  description = "Choose region for your stack"
  type        = "string"
  default     = "us-east-1"
}

variable "web_ec2_count" {
  description = "No of ec2 instance "
  type        = "string"
  default     = "2"
}

variable "nat_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-0915e09cc7ceee3ab"
    us-east-2 = "ami-097834fcb3081f51a"
  }
}

variable "web_amis" {
  type = "map"
  default = {
    us-east-1 = "ami-0915e09cc7ceee3ab"
    us-east-2 = "ami-097834fcb3081f51a"
  }
}

variable "web_instance_type" {
  description = "Choose instance type of web "
  type        = "string"
  default     = "t2.micro"
}

variable "my_app_s3_bucket" {
  default = "javahome-app-dev-sr"
}

variable "web_tags" {
  type = "map"
  default = {
    Name = "Webserver"
  }
}
