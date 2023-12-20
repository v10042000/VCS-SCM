terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

provider "aws" {
  # Configuration options
  provider "aws" {
    region     = "us-east-1"
    access_key = "AKIAUGT6CCVPNCZFOFGO"
    secret_key = "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"
  }
  # Linux-ubuntu-22.02
  resource "aws_instance" "ubuntu" {
    ami           = "ami-0fc5d935ebf8bc3bc" #Replacing with the desired AMI ID
    instance_type = "t2.micro"
    key_name      = "linux"
    subnet_id     = "subnet-04599829c779fb58b"
    user_data     = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /home/ec2-user/hello.txt
    EOF
  }
  vpc_security_group_ids = ["sg-062e5fe0ac3dfe607"]
  tags = {
    Name      = "Ubuntu"
    createdby = "terraform"
  }

}
