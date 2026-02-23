resource "aws_key_pair" "k8s_key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "k8s_sg" {
  name        = "aws-k8s-sg"
  description = "Security group for Kubernetes"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "K3s API internal"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubernetes NodePort"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
    description = "Internal cluster communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "debian" {
  most_recent = true

  owners = ["136693071363"] # Debian official

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
}

resource "aws_instance" "k8s_master" {
  ami                         = data.aws_ami.debian.id
  instance_type               = var.master_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.k8s_sg.id]
  key_name                    = aws_key_pair.k8s_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "aws-k8s-master"
  }
}

resource "aws_instance" "k8s_worker" {
  ami                         = data.aws_ami.debian.id
  instance_type               = var.worker_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.k8s_sg.id]
  key_name                    = aws_key_pair.k8s_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "aws-k8s-worker"
  }
}
