provider "aws" {
    region = "ap-southeast-2"
}

resource "aws_instance" "demo-ec2-instance" {
    ami = "ami-0fc925ad6f3e05713"
    instance_type = "t2.micro"
}
