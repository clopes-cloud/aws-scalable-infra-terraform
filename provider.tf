provider "aws" {
  region = "us-east-1"
  
  default_tags {
    tags = {
        owner = "user-test"
        managed-by = "terraform"
    }
  }
}
