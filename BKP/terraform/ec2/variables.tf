variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "aws-k8s-key"
}

variable "vpc_id" {}
variable "subnet_id" {}
