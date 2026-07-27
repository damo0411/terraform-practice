variable "my_bucket_1" {
  type = list(string)
  default = [ "aws-s3-bucket-112354", "aws-s3-bucket-8768768" ]
}

variable "my_bucket_2" {
    type = set(string)
    default = [ "aws-s3-bucket-897684687646846", "aws-s3-bucket-12456654466" ]
}

variable "primary" {
    type = object({
      name = string
    })
    default = {
      name = "primary-454684684687616546"
    }
  
}

variable "secondary" {
    type = object({
      name = string
    })
    default = {
      name = "secondary-454684684687616546"
    }
  
}