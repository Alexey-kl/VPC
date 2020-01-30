# output "VPC_ID" {
#   value = aws_vpc.vpc.id
# }

# output "VPC_tenancy" {
#   value = aws_vpc.vpc.instance_tenancy
# }

# output "VPC_CIDR" {
#   value =aws_vpc.vpc.cidr_block
# }

# output "VPC_ARN" {
#   value = aws_vpc.vpc.arn
# }

# output "subnet_ID" {
#   value = aws_subnet.subnet.id
# }

# output "subnet_arn" {
#   value = aws_subnet.subnet.arn
# }

# output "IGW_id" {
#   value = aws_internet_gateway.igw.id
# }


output "subnet_id" {
  #value = aws_subnet.subnet.id
  value = aws_subnet.subnet.id
}

output "security_group" {
  value = aws_security_group.security_group.id
}





