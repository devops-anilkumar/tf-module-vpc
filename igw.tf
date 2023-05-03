#CREATES INTERNET GATEWAY (IGW)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${var.ENV}-igw"
  }
}
#ELASTIC IP NEEDED FOR NAT GATEWAY
resource "aws_eip" "ngw-eip" {
  vpc      = true
  tags = {
    name = "roboshop-${var.ENV}-ngw-eip"
  }
}


# CREATES NAT GATEWAY TO EXPOSE THE PRIVATE NETWORK TO PRIVATE MACHINES
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = aws_subnet.public_subnet.*.id[0]

  tags = {
    Name = "robot-${var.ENV}-ngw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_eip.ngw-eip]
}