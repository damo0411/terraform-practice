#STRING FUNCTION
#lower(), upper(), replace(), substr(), trim(), split(), join(), chomp()


resource "aws_s3_bucket" "my-bucket" {
    bucket = replace (substr (lower(upper(var.bucketname)), 0, 63),"!","")
  
}

resource "aws_s3_bucket" "my-bukcet-1" {
bucket =(substr(replace(replace(lower(var.bucketname),"!",""),"","_"), 0, 63))
}

#lower()
output "lower" {
  value = lower("Hello World")
}

#upper()
output "upper" {
    value = upper("Hello World")
}

#substr
output "substr" {
  value = substr("hello_world",0,5)
}

#split
output "split" {
  value = split("_","hello_world")
}

#join
output "join" {
  value = join("_",["hello","world"])
}

#replace
output "replace"{
    value = replace("hello-world","-","_")
}

#chomp
output "chomp" {
  value = chomp("hello world\n")
}

#trim
output "trim" {
    value = trim ("####hello_world", "#")
}