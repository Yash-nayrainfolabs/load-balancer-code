# EC2 Instance Configuration
  resource "aws_instance" "test-instance" {
  ami = "ami-0261755bbcb8c4a84"
  vpc_security_group_ids = [aws_security_group.test_sec_GRP.id]
  instance_type = "t2.micro"
  key_name = "test-key"
  tags = {
  Name = "test-instance"

   }
  }

# Key Pair Configuration
resource "aws_key_pair" "test-key" {
  key_name   = "test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0nn/2Hy1ltf/NE3Igjr/bie6hn1KpzoHi+j6BC3YlrEr23ricNdhsaAUGOBNJO32nqWeSFM/uZMs5PHBXFwCaIaZdxPfNlFEXUmqcsvdzDhq1NefCF8dgdUgrORjhCoirGbZfoXXP3LJ7HZuTFiL8Ze8kS152WMtyLZGDXxUKU3M62TJt+MLQt7nVGmu81HD5wq6BsthyZPjbIJIRWj9vfetNZ9J2SSCZYIZwJDkM7xrxBo7ThYSZn5TVps1U5mkB8A3BsP9Xdgx+aawMADi7S2HfPP3bagdWES3TsYfhNRU00S2Y7tlEWPF41llYwvxEmwIxODn/t186+Lom7Ak7XVcvQzapXjqMPa4mwZUS70wBwr77A2S1WSUq1jGmEbLKvQ8oAQ8ZWGsd3yZOE9Ctca/McD7u9EJCx7BVkaCCwEBJW6AweM9xgGnRoefjfHegaja/y1qGnnz95pfwwI1AJu5dkg76Laurap0cM65PI1eYASalFe+a1R5648uMfx0= nay@nay"
}


# Security Group Configuration
resource "aws_security_group" "test_sec_GRP" {

    egress  {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    

  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    tags = {
      Name = "test_sec_GRP"
    }
}