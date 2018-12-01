##################################################################################
# VARIABLES
##################################################################################

variable "key_name" {
  default = "new2018"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
 region     = "us-east-1"
}

##################################################################################
# RESOURCES
##################################################################################

resource "aws_security_group" "jenkinssg" {
  name = "security_group_for_node_app_websg"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "jenkins_ami_number" {
  most_recent = true

  filter {
    name   = "name"
    values = ["jenkins-master*"]
  }
}

resource "aws_instance" "jenkinsMaster" {
  ami           = "${data.aws_ami.jenkins_ami_number.id}"
  instance_type = "t2.micro"
  count = 1
  security_groups = ["${aws_security_group.jenkinssg.id}"]
  associate_public_ip_address = true
  key_name        = "${var.key_name}"
}

