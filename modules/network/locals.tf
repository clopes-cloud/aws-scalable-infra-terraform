locals {
  public_subnets = {
    for k, v in var.subnets : k => v
    if v.type == "public"
  }

  private_subnets = {
    for k, v in var.subnets : k => v
    if v.type == "private"
  }

  nat_by_az = {
    for key, nat in aws_nat_gateway.nat :
    var.subnets[key].az => nat.id
  }
}
