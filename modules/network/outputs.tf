output "nat_ids" {
    description = "Created NAT ID by subnet"
    value = {
        for k, nat in aws_nat_gateway.nat :
        k => nat.id
    }
}

output "subnet_ids" {
    description = "Created Subnets ID"
    value = { for k, subnet in aws_subnet.subnets : k => subnet.id}
}

output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
    description = "Created Public Subnets IDs"
    value = [ for k, subnet in aws_subnet.subnets : 
    subnet.id
    if var.subnets[k].type == "public"
    ]
}

output "private_subnet_ids" {
    description = "Created Private Subnets IDs"
    value = [ for k, subnet in aws_subnet.subnets : 
    subnet.id
    if var.subnets[k].type == "private"
    ]
}

output "alb_security_group_id" {
    description = "Rules for ALB Security Group"
    value = aws_security_group.alb_security_group.id
}

output "instances_security_group_id" {
    description = "Rules for Instances EC2 Security group"
    value = aws_security_group.ec2_security_group.id
}
