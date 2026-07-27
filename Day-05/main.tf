resource "aws_instance" "my_ec2instance" {
  ami = "ami-09d88f7c4c272b0c5"
  instance_type = var.environment == "prod" ? "t3.large" : "t3.micro"
}

resource "aws_security_group" "my_sg_01" {
    name = "dynamic-${var.environment}"
    dynamic "ingress" {
        for_each = var.ingress_rules 
        content {
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
      
    }
  
}