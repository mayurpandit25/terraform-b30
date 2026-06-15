data "aws_vpc" "default" {
    default = true 
}

data "aws_subnet" "default" {
    filter {
        name   = "vpc-id"
        values = [data.aws_vpc.default.id]
    }
}

resource "aws_security_group" "sg" {
    name        = "my-security-group-for-default-vpc"
    description = "my-security-group-for-default-vpc"
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
        Name = "my-security-group-for-default-vpc"
    }
}

resource "aws_instance" "my_instance" {
    ami = "ami-0741dc526e1106ae5"
    instance_type = "t3.micro"
    key_name = "web"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("/root/terraform-b30/Day-2/user-data.sh")
    tags = {
        Name = "my-instance"
    }
}
