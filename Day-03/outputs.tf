output "aws_s3_bucket_names_count" {
  value = aws_s3_bucket.my_bucket_1[*].id
}

output "aws_s3_foreach_names" {

    value = [for bucket in aws_s3_bucket.my_bucket_2 : bucket.id]
}

output "aws_s3_foreach_arn" {
    value = [for  bucket in aws_s3_bucket.my_bucket_2: bucket.arn]
}

