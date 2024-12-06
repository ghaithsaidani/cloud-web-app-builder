output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = element(aws_subnet.public_subnet.*.id, 0)
}