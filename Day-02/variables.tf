variable "instance_tags" {
    type = map(string)
    default = {
      "environment" = "dev"
      "created_by" = "terraform"
      "cost_centre" = "mavenir"
    }
}
variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "availability_zone" {
    type = set(string)
    default = [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]

}

variable "associate_public_ip_address" {
    type = bool
    default = true
}

variable "volume_size" {
    type = number
    default = 8
}

variable "volume_type" {
    type = string
    default =  "gp3" 
}

variable "server_config" {
    type = object({
      name = string
      instance_type = string
    })
    default = {
      name = "webserver"
      instance_type = "t3.micro"
    }
   
}

variable "aws_cidr" {
    type = tuple([string, string])
    default = ["10.0.0.0/16", "172.16.0.0/16"]
}

variable "sg_configs" {
    type = list(object({
      from_port = number
      to_port = number
      protocol = string
    }))

    default =[ 
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
    },

    {
        from_port = 443
        to_port = 443
        protocol = "tcp"
    }


    ]
}

variable "egress_configs" {
    type = tuple([ number, number, string ])
    default = [ 0, 0, "any" ]
}