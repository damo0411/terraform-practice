#Collection Functions
#tolist() , toset(), length(), concat(), merge(), reverse()

output "tolist" {
    value = tolist(["34","tue", "true"])
}

output "toset" {
    value = toset(["long","short"])
}

output "length" {
    value = length("66")
}

output "concat" {
  value = concat(["aws"], ["s3"])
}

output "merge" {
    value = merge(
        {Name = "Bucket", Region="ap-south-1"},
        {Complaince = "SOC"}
    )
}

output "reserve"{
    value = reverse(["yuu","huu"])
}

#Type Conversion
# tostring(), tonumber(), tobool()

output "tostring" {
    value =  tostring("1545")
}

output "tonumber" {
  value = tonumber("125454")
}

output "tobool" {
    value = tobool("false")
}