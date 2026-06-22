resource "aws_instance" "example" { 
  instance_type = "t3.micro" 
  ami             = "ami-0741dc526e1106ae5" 
  key_name        = "web" 
  vpc_security_group_ids = ["sg-00e0314dcd4d32fba"] 
 
  provisioner "file" { 
    source         = "hello.txt" 
    destination = "/home/ec2-user/aws/" 
  } 
 
  provisioner "local-exec" { 
    command = "echo ${self.private_ip} >> private_ips.txt" 
  } 
 
  connection { 
    type        = "ssh" 
    user        = "ec2-user" 
    private_key = file("${path.module}/web.pem") 
    host        = self.public_ip 
  } 
 
  provisioner "remote-exec" { 
    inline = [ 
    "sudo yum install httpd -y", 
    "sudo systemctl start httpd", 
    "sudo systemctl enable httpd" 
    ] 
  } 
} 

