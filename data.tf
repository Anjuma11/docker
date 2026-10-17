data "aws_ami" "joindevops" {
  owners           = ["759713897143"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

