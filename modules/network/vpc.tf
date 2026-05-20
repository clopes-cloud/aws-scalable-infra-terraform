resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "vpc-terraform"
    }
}

resource "aws_subnet" "subnets" {
    for_each = var.subnets

    vpc_id = aws_vpc.vpc.id
    
    cidr_block = each.value.cidr_block
    availability_zone = each.value.az
    map_public_ip_on_launch = each.value.type == "public"

    tags = {
        Name = each.key
        Type = each.value.type
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = "internet-gateway-terraform"
    }
}
