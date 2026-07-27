# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get current AWS region
data "aws_region" "current" {}

# Get availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# ==============================
# Example 1: create_before_destroy
# Use Case: EC2 instance that needs zero downtime during updates
# ==============================

resource "aws_instance" "my_instance" {
  ami ="ami-09d88f7c4c272b0c5"
  region = "ap-south-1"
  availability_zone = "ap-south-1a"
  instance_type = "t3.micro"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket" "my-bucket" {
    bucket = "my-bukcet-546846541654"
    lifecycle {
      prevent_destroy = true
    }
  
}

resource "aws_launch_template" "my_launch_template" {
    name_prefix = "my_launch_template_01"
    instance_type = "t3.micro"
    image_id = "ami-09d88f7c4c272b0c5"
  
}


resource "aws_autoscaling_group" "my_asg_01" {
    name = "app-server-asg"
    min_size = 1
    max_size = 3
    desired_capacity = 2 
    health_check_type = "EC2"
    availability_zones = ["ap-south-1a", "ap-south-1b"]
    
    launch_template {
      id = aws_launch_template.my_launch_template.id
      version = "$Latest"
    }

    lifecycle {
      ignore_changes = [ desired_capacity ]
    }
  
}

resource "aws_s3_bucket" "bucket_pre" {
    bucket = "validated_region_54684684"
  lifecycle {
    precondition {
      condition = contains(var.allowed_regions, data.aws_region.current.name)
      error_message = "this is not in valid region"
    }
  }
}

resource "aws_s3_bucket" "bucket_post" {
    bucket = "postconfition-654684651545"
    tags = {
        name = "dev-bucket"
        complaince = "soc"
    }
    lifecycle {
      postcondition {
        condition = contains(keys(self.tags), "complaince")
        error_message = "this is not contain complaince"
      }
    }
}

# Example 6: replace_triggered_by
# Use Case: Replace EC2 instances when security group changes
# ==============================

# Security Group
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Security group for application servers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

}

# EC2 Instance that gets replaced when security group changes
resource "aws_instance" "app_with_sg" {
  ami                    = "ami-09d88f7c4c272b0c5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

 

  # Lifecycle Rule: Replace instance when security group changes
  # This ensures the instance is recreated with new security rules
  lifecycle {
    replace_triggered_by = [
      aws_security_group.app_sg.id
    ]
  }
}
