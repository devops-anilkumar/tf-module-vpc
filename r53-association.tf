resource "aws_route53_zone_association" "secondary" {
  zone_id = "Z01019823KGEEYKYEE9GQ" // var.PRIVATE_HOSTED_ZONE_ID
  vpc_id  = aws_vpc.main.id
}