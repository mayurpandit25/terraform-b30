resource "aws_s3_bucket" "s3" {
    bucket = "mayur-s3-bucket-amazon1234"
    tags = {
        Name = "mayur-s3-bucket-amazon1234"
    }

    lifecycle {
      prevent_destroy = true 
    }
}

