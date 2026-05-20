resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public-rt-terraform"
    }
}

resource "aws_route_table_association" "public_rta" {
    for_each = local.public_subnets

    subnet_id = aws_subnet.subnets[each.key].id
    route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table" "private_route" {
  for_each = local.private_subnets

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = local.nat_by_az[each.value.az]
  }

  tags = {
    Name = "private-rt-terraform-${each.key}"
  }
}

resource "aws_route_table_association" "private_rta" {
  for_each = local.private_subnets

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.private_route[each.key].id
}
