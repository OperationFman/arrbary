resource "aws_instance" "ec2-instance" {
    name = "arrbary"
    ami = "ami-09eebd0b9bd845bf1"
    instance_type = "t2.large"

    vpc_security_group_ids = [
        aws_security_group.allow-ssh.id,
        aws_security_group.k8s-admin.id,
    ]

    user_data = "${file("user_data.sh")}"
}
