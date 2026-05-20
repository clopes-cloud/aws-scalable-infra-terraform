resource "aws_eip" "eip" {
    for_each = local.public_subnets

    domain   = "vpc"

    tags = {
      Name = "nat-eip-${each.key}"
    }
}

resource "aws_nat_gateway" "nat" {
  for_each = local.public_subnets

  subnet_id     = aws_subnet.subnets[each.key].id
  allocation_id = aws_eip.eip[each.key].allocation_id

  tags = {
    Name = "nat-gw-terraform-${each.key}"
  }

  depends_on = [aws_internet_gateway.igw]
}
