provider "aws" {
  region  = var.region
  profile = "chatwit"
}

## Tf.state file copy over the S3 Bucket
terraform {
  backend "s3" {
    bucket                  = "terraform-state-files-all"
    key                     = "multi-cloud-terraform/terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials"
    region                  = "ap-south-1"
    profile                 = "chatwit"
  }
}
# Define the data source to get a list of available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "example" {
  ami           = var.ami_id[var.region]      
  instance_type = "t3.micro"
  availability_zone = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))
  count = 5
  tags = {
    Name = "multi-region"
  }
}