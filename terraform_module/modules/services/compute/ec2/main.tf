resource "aws_key_pair" "my_key_pair"{
    key_name = var.key_name
    public_key = var.public_key
}
resource "aws_security_group" "allow_ssh"{
    vpc_id = var.vpc_id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = [ "0.0.0.0/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks= [ "0.0.0.0/0"]
    }
}
resource "aws_instance" "gopi_instance"{
    instance_type = var.instance_type
    ami = var.ami
    subnet_id = var.subnet_id   
    vpc_security_group_ids = [ aws_security_group.allow_ssh.id]
    associate_public_ip_address = true
    key_name = aws_key_pair.my_key_pair.key_name
}