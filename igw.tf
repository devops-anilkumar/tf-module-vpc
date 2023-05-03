#CREATES INTERNET GATEWAY (IGW)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "roboshop-${var.ENV}-igw"
  }
}