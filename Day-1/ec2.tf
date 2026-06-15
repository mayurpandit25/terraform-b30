resource "aws_instance" "ec2" {
    ami           = "ami-0db56f446d44f2f09"
    instance_type = "t3.micro"
    key_name      = "terraform"
    vpc_security_group_ids  = ["sg-07a3bf6deab68c202"]
    disable_api_termination = false
    user_data               = file("/root/terraform-b30/Day-1/user-data.sh")

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags   = {
      Name = "my-instance"
    }
}


