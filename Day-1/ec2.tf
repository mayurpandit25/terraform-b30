resource "aws_instance" "ec2" {
    ami           = "ami-0db56f446d44f2f09"
    instance_type = "t3.micro"
    key_name      = "terraform"
    vpc_security_group_ids  = [aws_security_group.sg.id]
    disable_api_termination = false
    user_data               = file("/root/terraform-b30/Day-1/user-data.sh")
    depends_on = [ aws_security_group.sg ] 

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags   = {
      Name = "my-instance"
    }
}


data "aws_vpc" "default" {
    default = true 
}

# data "aws_subnet" "default" {
#     filter {
#         name   = "vpc-id"
#         values = [data.aws_vpc.default.id]
#     }
# }

resource "aws_security_group" "sg" {
    name        = "my-security-group-ec2"
    description = "my-security-group-ec2"
    vpc_id      = data.aws_vpc.default.id 

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "my-security-group-ec2"
    }
}


