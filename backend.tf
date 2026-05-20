terraform {
    backend "s3" {
        bucket = "user-remote-state"
        key = "aws-vpc/terraform.tfstate"
        region = "us-east-1"
    }
}
