resource "aws_instance" "ec2" {
ami = "ami-0e83be366243f524a"
instance_type = "t2.micro"
key_name = "Montse"

	tags = {
		Name = "Montse ec2"
	}

	vpc_security_group_ids = [aws_security_group.Montse_server.id]

}

output "My_ip" {
	value = aws_instance.ec2.public_ip
}

resource "aws_security_group" "Montse_server" {
  name        = "Montse Sec Group"
  description = "Security group for SSH and HTTP access"
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090  
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080  
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


egress {    
	from_port = 0   
	to_port   = 0    
	protocol  = "-1"    
	cidr_blocks = ["0.0.0.0/0"]    
 }


tags = {
                Name = "Montse sec group2"
        }
}
