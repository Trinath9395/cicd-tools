data "aws_ami" "ami_info" {

    most_recent = true
    owners = ["658775564324"]

    filter {
        name   = "image-id"
        values = ["ami-02457590d33d576c3"]
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