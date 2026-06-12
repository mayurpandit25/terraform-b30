resource "aws_instance" "ec2" {
    ami = "ami-0db56f446d44f2f09"
    instance_type = "t3.micro"
    key_name = "terraform"
    vpc_security_group_ids = ["sg-07a3bf6deab68c202"]
    disable_api_termination = true 

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd.service
                sudo systemctl enable httpd.service
                sudo echo "<h1> Hello Apache2! </h1>" > /var/www/html/index.html
                sudo systemctl restart httpd.service
                EOF

    tags = {
      Name = "my-instance"
    }
}