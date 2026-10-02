# Latest Amazon Linux 2023 AMI, resolved from the public SSM parameter
data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web" {
  name_prefix = "cloudcamp-web-"
  description = "Allow inbound HTTP from the internet"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = var.service_port
    to_port     = var.service_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "cloudcamp-web"
    Environment = "Dev"
    ManagedBy   = "terraform"
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ssm_parameter.al2023.insecure_value
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<-USERDATA
    #!/bin/bash
    dnf install -y nginx
    echo "<h1>CloudCamp - deployed by HCP Terraform from $(hostname)</h1>" > /usr/share/nginx/html/index.html
    systemctl enable --now nginx
  USERDATA

  tags = {
    Name        = "cloudcamp-web"
    Environment = "Dev"
    ManagedBy   = "terraform"
  }
}
