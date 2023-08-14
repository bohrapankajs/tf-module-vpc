resource "aws_route53_zone_association" "vpc-association" {
  zone_id = var.PRIVATE_HOSTED_ZONEID
  vpc_id  = aws_vpc.main.id
}