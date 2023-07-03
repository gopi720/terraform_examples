terraform {
    required_providers{
        aws={
            source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
    profile = "gopi"
}
/* terraform {
  backend "s3" {
      bucket = "aws-state-file"
      key = "global/s3/terraform.tfstate"
      region = "ap-south-1"
      dynamodb_table = "s3-state-file-locking"
  }
} */
/* #resource "aws_s3_bucket" "terraformstate" {
          bucket = "aws-state-file"
  } */
/* #resource "aws_dynamodb_table" "s3statefile" {
              name = "s3-state-file-locking"
              billing_mode = "PAY_PER_REQUEST"
              hash_key = "LockID"
   attribute {
    name = "LockID"
    type = "S"
  }
} */
resource "aws_vpc" "myvpc"{
    cidr_block = var.vpc_cidrblock
    tags={
        Name="myvpc"
    }
}
resource "aws_subnet" "mysubnet"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet_cidrblock
    availability_zone = "ap-south-1a"
    tags ={
        Name= "public_subnet"
    }
}
resource "aws_security_group" "ssh_access"{
    vpc_id = aws_vpc.myvpc.id
    ingress{
        from_port = 22
        to_port = 22
        protocol= "TCP"
        cidr_blocks= [ "0.0.0.0/0"]
    }
    egress{
        from_port= 0
        to_port= 0
        protocol= -1
        cidr_blocks= [ "0.0.0.0/0"]
    }
}
resource "aws_key_pair" "gopi_keypair"{
    key_name= "key"
    public_key=var.public_key
}
resource "aws_internet_gateway" "myig"{
    vpc_id= aws_vpc.myvpc.id
    tags={
        Name="myig"
    }
}
resource "aws_route_table" "myrtb"{
    vpc_id= aws_vpc.myvpc.id
    route{
        cidr_block= "0.0.0.0/0"
        gateway_id=aws_internet_gateway.myig.id
    }
}
resource "aws_route_table_association" "ig_association"{
    subnet_id= aws_subnet.mysubnet.id
    route_table_id=aws_route_table.myrtb.id
}
resource "aws_instance" "myinstance"{
    instance_type= "t2.micro"
    count = 2
    ami= "ami-07ffb2f4d65357b42"
    subnet_id=aws_subnet.mysubnet.id
    key_name= aws_key_pair.gopi_keypair.key_name
    vpc_security_group_ids=[aws_security_group.ssh_access.id]
    associate_public_ip_address = true
  tags = {
          Name = "main.${count.index}"
        }
}