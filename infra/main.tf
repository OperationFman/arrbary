resource "aws_instance" "demo-ec2-instance" {
    ami = "ami-06fdec94cc3067ad1"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.ssh-group.id]

    # user_data = "${file("k8s-bootstrap.sh")}"
}

