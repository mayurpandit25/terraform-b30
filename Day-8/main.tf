#####TERRAFORM IMPORT#######
#resource "aws_s3_bucket" "s3" {}

#####TERRAFORM LOOPS#######
# resource "aws_instance" "instance" {
#     for_each = tomap({
#         server-1 = "t3.micro"
#         server-2 = "t3.small"
#         server-3 = "c7i-flex.large"
#     })

#     ami = "ami-0741dc526e1106ae5"
#     instance_type = each.value 
#     tags = {
#         Name = each.key
#     }
# }

######TERRAFORM WORKSPACE#######

resource "random_id" "random_id" {
    byte_length = 8
}

resource "aws_s3_bucket" "demo_bucket" {
    bucket = "demo-bucket-${terraform.workspace}-${random_id.random_id.hex}"
  
}

