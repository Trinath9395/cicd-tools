module "jenkins" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name   = "jenkins"

  instance_type      = "t3.small"
  vpc_security_group_ids = [var.security_group_id]
  subnet_id          = "subnet-0452ce0b87e65b4ee"
  ami                = data.aws_ami.ami_info.id
  user_data          = file("jenkins.sh")

  tags = {
    Name = "jenkins"
  }

  root_block_device = [{
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }]
}

module "jenkins-agent" {
  source = "terraform-aws-modules/ec2-instance/aws"
  name   = "jenkins-agent"

  instance_type      = "t3.small"
  vpc_security_group_ids = [var.security_group_id]
  subnet_id          = "subnet-0452ce0b87e65b4ee"
  ami                = data.aws_ami.ami_info.id
  user_data          = file("jenkins-agent.sh")

  tags = {
    Name = "jenkins-agent"
  }

  root_block_device = [{
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }]
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name            = "jenkins"
      type            = "A"
      ttl             = 60
      records         = [module.jenkins.public_ip]
      allow_overwrite = true
    },
    {
      name            = "jenkins-agent"
      type            = "A"
      ttl             = 60
      records         = [module.jenkins-agent.private_ip]
      allow_overwrite = true
    }
  ]
}
