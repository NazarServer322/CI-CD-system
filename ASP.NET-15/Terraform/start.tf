provider "aws" {
  region     = "eu-north-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "MasterJenkins" {
  count                  = 1
  ami                    = "ami-0ed17ff3d78e74700"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a1e8877869bf18cc"]
  key_name               = "devOps_masta"
  user_data              = file("script.sh")

  tags = {
    Name    = "Nazar-master"
    Owner   = "NazarServer"
    Project = "Master Slave"
  }
}

resource "aws_instance" "NodeJenkins" {
  count                  = 1
  ami                    = "ami-0ed17ff3d78e74700"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a1e8877869bf18cc"]
  key_name               = "DevOps_node"
  user_data       = file("scriptNode.sh")

  tags = {
    Name    = "my-node-for-test"
    Owner   = "NazarServer"
    Project = "Master Slave"
  }
}

resource "aws_instance" "NodeTest" {
  count                  = 1
  ami                    = "ami-0ed17ff3d78e74700"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a1e8877869bf18cc"]
  key_name               = "DevOps_node"
  user_data       = file("scriptNode.sh")

  tags = {
    Name    = "node-for-delivery"
    Owner   = "NazarServer"
    Project = "Master Slave"
  }
}
