resource "aws_vpc_peering_connection" "peer" {
// peer_owner_id = var.peer_owner_id  # if your peer vpc which are in the same account , this optin is not needed
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.DEFAULT_VPC_ID
  auto_accept   = true  # this optin is valid if only both the vpcs are in same account and same region only
}