resource "aws_security_group" "ingress-ssh" {
  name   = "${var.environment}-${var.sg_name}"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.environment}-${var.sg_name}"
  }
}

resource "aws_instance" "public_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnets["public_subnet_1"].id
  security_groups             = [aws_security_group.ingress-ssh.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = {
    Name = "${var.environment}-ssh-instance-01"
  }
}

resource "aws_instance" "private_servers" {
  for_each = var.instance_configs

  ami             = each.value.ami
  instance_type   = each.value.app_instance_type
  key_name        = each.value.app_key_name
  subnet_id       = var.private_subnets[each.value.subnet_key].id
  security_groups = [aws_security_group.ingress-ssh.id]
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  tags = {
    Name = "${var.environment}-${each.value.name}"
  }
}

