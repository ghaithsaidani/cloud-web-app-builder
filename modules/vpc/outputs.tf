output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = element(aws_subnet.public_subnet.*.id, 0)
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}