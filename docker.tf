resource "aws_instance" "docker" {
  ami           = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("docker.sh")
  #iam_instance_profile = "TerraformAdmin"
  tags = {
     Name = "${var.project}-${var.environment}-docker"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all_docker"
  description = "Allow all inbound and outbound traffic"
 
   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
  

  tags = {
    Name = "${var.project}-${var.environment}-docker"
  }
}

  