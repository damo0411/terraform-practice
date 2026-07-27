resource "aws_instance" "my_ec2_instance" {
    ami = "ami-09d88f7c4c272b0c5"
    region = var.aws_region
    instance_type = var.server_config.instance_type
    availability_zone = tolist(var.availability_zone)[0]
    associate_public_ip_address =  var.associate_public_ip_address
    vpc_security_group_ids = [aws_security_group.web-security.id]
    root_block_device {
      volume_size = var.volume_size
      volume_type =  var.volume_type
    }
    tags = var.instance_tags
  
}

resource "aws_security_group" "web-security" {
    name = "${var.server_config.name}-sg"
    dynamic "ingress" {
        for_each = var.sg_configs
        content {
        from_port = ingress.value.from_port
        to_port =  ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = var.aws_cidr
    } 
    } 
    
    egress {
        from_port = var.egress_configs[0]
        to_port =  var.egress_configs[1]
        protocol = var.egress_configs[2]
      
    }
    tags = var.instance_tags
}