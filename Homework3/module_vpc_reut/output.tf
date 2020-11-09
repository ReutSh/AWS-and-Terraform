output "vpc_id" {
    value = aws_vpc.reut_vpc.id #fixed. you set: aws_vpc.reut_vpc.*.id . why ".*.id"?? you have only one vpc. you need the syntax with the * just when you create more than one resources in block
}

output "public_subnets_id" {
    value = aws_subnet.public_subnet.*.id
}

output "private_subnet_id" {
    value = aws_subnet.private_subnet.*.id
}

