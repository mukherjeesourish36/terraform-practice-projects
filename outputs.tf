# output "aws-public-ip"{
#     value = aws_instance.example[*].public_ip
# }

# output "aws-public-dns" {
#   value = aws_instance.example[*].public_dns
# }

# output "aws-private-ip" {
#   value = aws_instance.example[*].private_ip
# }

output "aws-public-ip" {
  value = [
    for instance in aws_instance.example : instance.public_ip
  ]
}

output "aws-public-dns" {
  value = [
    for instance in aws_instance.example : instance.public_dns
  ]
}

output "aws-private-dns" {
  value = [
    for instance in aws_instance.example : instance.private_ip
  ]
}