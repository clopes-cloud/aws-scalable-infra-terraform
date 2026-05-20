module "network" {
    source = "./modules/network"
}

module "alb" {
    source = "./modules/alb"

    vpc_id = module.network.vpc_id
    subnet_ids = module.network.public_subnet_ids
    security_groups = [ module.network.alb_security_group_id ]
}

module "ec2" {
    source = "./modules/ec2"

    vpc_id = module.network.vpc_id
    subnet_ids = module.network.private_subnet_ids
    security_groups = [module.network.instances_security_group_id]
    target_group_arn = module.alb.target_group_arn

    user_data = <<-EOF
    #!/bin/bash
    yum install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "OK" > /usr/share/nginx/html/health
    EOF

    ami_id = data.aws_ami.amazon_linux_2023.id
}
