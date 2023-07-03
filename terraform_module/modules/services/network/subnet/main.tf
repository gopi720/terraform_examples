resource "aws_subnet" "public_subnet" {
    vpc_id = var.vpc_id
    cidr_block = var.cidr_block
    availability_zone = "ap-south-1a"
    tags = {
        Name = "public_subnet"
    }
}