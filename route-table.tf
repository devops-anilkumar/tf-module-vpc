# CREATES PUBLIC ROUTE TABLE
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id
  
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block                = var.DEFAULT_VPC_CIDR
    vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  }
  tags = {
    Name = "roboshop-${var.ENV}-public-rt"
  }
}

# ATTACH PUBLIC ROUTE TABLE TO THE PUBLIC SUBNET
resource "aws_route_table_association" "public-rt-association" {
  count                   = length(aws_subnet.public_subnet.*.id)
  subnet_id               = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id          = aws_route_table.public-rt.id
}