data "aws_ami" "ami_info" {
  most_recent = true
  owners      = ["137112412989"] # Amazon Linux official owner

  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.20250527.1-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

