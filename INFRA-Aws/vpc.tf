

module vpc {
    source = "terraform-aws-modules/vpc/aws"
    version = "3.2.0"
    name = "Demo-VPC"
    cidr = "10.0.0.0/16"
    azs = local.availability_zones
    public_subnets =  ["10.0.4.0/24","10.0.5.0/24"]
    enable_nat_gateway = false
    single_nat_gateway = false
    map_public_ip_on_launch = true
 
 tags = {
    "Name" = "Demo-VPC"
}
public_subnet_tags = {
    "Name" = "Demo-Public-Subnet"
}

}