# # count.index is going to fetch the count iteration and element is going to fetch the value from the list as per the index
# # count and element are funcitons in terraform
# resource "aws_subnet" "public" {
#   count                    = length(var.PUBLIC_SUBNET_CIDR) 
#   vpc_id                   = aws_vpc.main.id
#   cidr_block               = element(var.PUBLIC_SUBNET_CIDR, count.index)
#   availability_zone        = element(var.AZ, count.index)
#   map_public_ip_on_launch  = true

#   tags = {
#     Name = "${var.ENV}-pub-${element(var.AZ, count.index)}"
#   }
# }
resource "aws_subnet" "public" {
    count                   = length(var.PUBLIC_SUBNET_CIDR)
    vpc_id                  = aws_vpc.main.id
    cidr_block              = element(var.PUBLIC_SUBNET_CIDR, count.index)
    availability_zone       = element(var.AZ, count.index)
    map_public_ip_on_launch  = true

  tags = {
    Name = "${var.ENV}-pub-${element(var.AZ, count.index)}"
  }

}


# Creates private subnets
resource "aws_subnet" "private" {
  count                 = length(var.PRIVATE_SUBNET_CIDR) 
  vpc_id                = aws_vpc.main.id
  cidr_block            = element(var.PRIVATE_SUBNET_CIDR, count.index)
  availability_zone     = element(var.AZ, count.index)

  tags = {
    Name = "${var.ENV}-prv-${element(var.AZ, count.index)}"
  }
}