resource "aws_security_group" "alb_security_group" {
    name = "alb-sg-terraform"
    vpc_id = aws_vpc.vpc.id

    ingress {
        description = "HTTP from internet"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS from internet"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {  
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "alb-sg-terraform"
  }
}

resource "aws_security_group" "ec2_security_group" {
    name = "ec2-sg-terraform"
    vpc_id = aws_vpc.vpc.id

    ingress {
        description = "HTTP from ALB"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security_group.alb_security_group.id]
    }

    ingress {
        description = "HTTPS from ALB"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = [aws_security_group.alb_security_group.id]
    }

    egress {  
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
        Name = "ec2-sg-terraform"
  }
}
