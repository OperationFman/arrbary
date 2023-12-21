resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh"
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

resource "aws_security_group" "k8s-admin" {
  name = "k8s-admin"

  ingress {
      from_port = 8443
      to_port = 8443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}