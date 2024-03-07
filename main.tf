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

resource "aws_instance" "example" {
  ami           = var.ami_id[var.region]      
  #ami = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  tags = {
    Name = "multi-region"
  }
}