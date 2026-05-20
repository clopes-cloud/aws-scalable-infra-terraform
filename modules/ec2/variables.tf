variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "target_group_arn" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "user_data" {
  type = string
}
