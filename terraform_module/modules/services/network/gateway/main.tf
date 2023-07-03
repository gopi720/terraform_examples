resource "aws_internet_gateway" "myig"{
    vpc_id = var.vpc_id
    tags = {
        Name = "gopiig"
    }
}
resource "aws_route_table" "myrtb"{
   vpc_id = var.vpc_id
   route {
       cidr_block = var.ig_cidrblock
       gateway_id = aws_internet_gateway.myig.id
   }
}
resource "aws_route_table_association" "ig_association"{
    subnet_id = var.subnet_id
    route_table_id = aws_route_table.myrtb.id
}