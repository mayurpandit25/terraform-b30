provider "aws" {
    region  = "us-east-2"
    profile = "dev"
}

terraform {
  backend "s3" {
    bucket = "amazon-s3-bucket-mayur"
    key    = "terraform.tfstate"
    region = "us-east-2"
    use_lockfile = true 
    profile = "dev"
    shared_credentials_files = [ "/root/.aws/credentials" ]
  }
}
