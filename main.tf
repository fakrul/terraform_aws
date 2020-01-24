resource "aws_security_group" "bullseye" {
  name = "bullseye"
  description = "Security Group for bullseye"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }   
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bullseye" {
  ami = "ami-05850fe0bf797791c"
  instance_type = "t2.micro"
  user_data = "${file("initial.conf")}"
  security_groups = ["${aws_security_group.bullseye.id}"]
  subnet_id = "subnet-4d89ce28"
  ipv6_address_count = 1
  tags = {
    Name = "bullseye"
    "DHCP option" = "alam.rocks"
  }
}

