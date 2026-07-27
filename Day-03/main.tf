resource "aws_s3_bucket" "my_bucket_1" {
bucket = var.my_bucket_1[count.index]
count = length(var.my_bucket_1)
}

resource "aws_s3_bucket" "my_bucket_2" {
  for_each = var.my_bucket_2
  bucket = each.value
  
}

resource "aws_s3_bucket" "primary" {
    bucket = var.primary.name
   
}

resource "aws_s3_bucket" "secondary" {
  depends_on = [ aws_s3_bucket.primary ]
  bucket = var.secondary.name
  
}