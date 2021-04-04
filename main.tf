resource "aws_instance" "my-ec2-instance" {
  ami                    = var.my_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.instance.id]


  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "pocInstance"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}