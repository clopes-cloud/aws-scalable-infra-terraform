variable "subnets" {
    type = map(object({
        cidr_block = string
        az = string
        type = string
    }))
    default = {
        public-1 = {
            cidr_block = "10.0.0.0/24"
            az = "us-east-1a"
            type = "public"
        }
        public-2 = {
            cidr_block = "10.0.3.0/24"
            az = "us-east-1b"
            type = "public"
        }
        private-1 = {
            cidr_block = "10.0.1.0/24"
            az = "us-east-1a"
            type = "private"
        }
        private-2 = {
            cidr_block = "10.0.2.0/24"
            az = "us-east-1b"
            type = "private"
        }
    }
}
