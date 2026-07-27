terraform {
  backend "s3" {
    bucket = "s3-remote-backend-1132"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true    
  }
}