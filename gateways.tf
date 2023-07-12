# Creates Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "robot-${var.ENV}-igw"
  }
}

# Allocates EIP needed for ngw 
resource "aws_eip" "ngw-eip" {
  vpc      = true

  tags = {
    Name = "robot-${var.ENV}-ngw-eip"
  }

}

# Creates NAT Gateway ; NAT GW Needs an elastic IP, so create an elastic ip
# resource "aws_nat_gateway" "ngw" {
#   allocation_id = aws_eip.ngw-eip.id
#   subnet_id     = aws_subnet.public.*.id[0]

#   tags = {
#     Name = "robot-${var.ENV}-igw"
#   }

# # This ensure, this ngw will only be created if the igw is created
#   depends_on = [aws_internet_gateway.igw]
# }
resource "aws_nat_gateway" "ngw" {

    allocation_id  = aws_eip.ngw-eip.id 
    subnet_id      = aws_subnet.public.*.id[0]
  tags = {
    Name = "robot-${var.ENV}-igw"
  }
 depends_on = [aws_internet_gateway.igw]   
}