resource "aws_instance" "instance" {
    for_each = tomap({
        server-1 = "t3.micro"
        server-2 = "t3.small"
        server-3 = "c7i-flex.large"
    })

    ami = "ami-0741dc526e1106ae5"
    instance_type = each.value 
    tags = {
        Name = each.key
    }
}


