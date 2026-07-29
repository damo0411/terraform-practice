#Date & Timefunctions
# timestamp(), formatdate(), timeadd()

output "timestamp" {
  value = timestamp()
}

output "formatdate"{
    value = formatdate("YYYY-MM-DD", timestamp())
}

output "timeadd"{
    value = timeadd(timestamp(), "24h")
}

#Validation Functions

#can(), contains(), regex(), startswith(), endswith()

output "can" {
    value = can(tostring("778844"))
}

output "startswith"{
    value = startswith("aws_s3","aws")
}

output "endswith" {
  value = endswith("aws_s3","s3")
}

output "regex" {
  value = regex("[0-9]+", "123339809")
}

output "contains" {
  value = contains(["dev","stg","prod"],"test")
}

#lookup functions:
#lookup(), element(), index()

output "index" {
  value = index(["dev", "stg", "prod"], "prod")
}

output "element" {
  value = element(["us-east-1", "ap-south-1", "ca-central-1", "us-west-2"], 13)
}

output "lookup" {
  value = lookup({dev= "t2.micro", stg = "t3.micro"}, "stg", "t4.large")
}

#filefunction:
#file(), fileexists(), dirname(), basename(), jsondecode(), jsonencode()

output "file_example" {
  value = file("${path.module}/provider.tf")
}

output "file_exists" {
  value = fileexists("${path.module}/main.tf")
}

output "dirname_example" {
  value = dirname("C:/Users/baska/OneDrive/Desktop/terraform-practice/Day-10/main.tf")
}
# Result: "C:/Users/baska/OneDrive/Desktop/terraform-practice/Day-10"


output "basename_example" {
  value = basename("C:/Users/baska/OneDrive/Desktop/terraform-practice/Day-10/main.tf")
}
# Result: "main.tf"

output "dirname1" {
  value = dirname("${path.module}/main.tf")
}

output "basename2"{
    value = basename("${path.module}/provider.tf")
}

output "jsondecode_example" {
  value = jsondecode("{\"name\": \"bucket1\", \"size\": 100}")
}

output "jsonencode_example" {
  value = jsonencode({
    name = "bucket1"
    size = 100
  })
}