resource "aws_instance" "demo-ec2-instance" {
    ami = "ami-06fdec94cc3067ad1"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.ssh-group.id]

    user_data = "${file("k8s-bootstrap.sh")}"
}

resource "aws_security_group" "ssh-group" {
    name = "ssh"
    ingress { 
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
