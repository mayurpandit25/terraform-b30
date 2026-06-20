resource "aws_instance" "my-instance" {
    ami = ""
    instance_type = "t3.micro"
    key_name = "web"

    tags = {
        Name = "my-instance"
    }

    lifecycle {
      create_before_destroy = true 
    }
}

