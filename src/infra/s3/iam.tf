provider "aws" {
  region  = "us-east-1"
}

variable "aws_region" {
  type = string
  description = "Default region used by some modules"
  default = "us-east-1"
}

variable "env" {
  description = "AWS region to launch servers."
  default     = "sandbox"
}

variable "aws_account_id" {
  description = "aws account ID"
  default = "xxxxxx"
}

variable "ip_whitelist" {
  description = "source IP whitelist"
  default = "10.1.1.0/24"
}

variable "project" {
  description = "Project name"
  default = "odp-ref-arch"
}

module "iam" {
  source = "../"
  aws_region = "${var.aws_region}"
  env = "${var.env}"
  aws_account_id = "${var.aws_account_id}"
  ip_whitelist = "${var.ip_whitelist}"
  project = "${var.project}"
}
