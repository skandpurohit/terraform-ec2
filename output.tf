output "public_ip" {
  value       = aws_instance.my-ec2-instance.public_ip
  description = "The public IP of my-ec2-instance"
}