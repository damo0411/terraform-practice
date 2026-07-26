terraform {
  backend "s3" {
    bucket = "s3-remote-backend-1132"
    key = "dev\terraform.tfstate"
    use_lockfile = true
    encrypt = true
    region = "ap-south-1"
  }
}