variable "region" {
  type = string
  default = "ap-south-1"
  validation {
    condition = contains(["ap-south-1","us-east-1","us-east-2"],var.region)
    error_message = "Valid values for region are: ap-south-1, us-east-1, us-east-2"
  }
}
variable "ami_id" {
  type = map
  default = {
    "ap-south-1" = "ami-0a1b648e2cd533174"
    "us-east-1" = "ami-0ff8a91507f77f867"
    "us-east-2" = "ami-0b59bfac6be064b78"
    
    }
  }
