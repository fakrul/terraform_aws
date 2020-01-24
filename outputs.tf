output "public_ip" {
    value       = aws_instance.bullseye.public_ip
    description = "The public IP of the web server is: "
}
