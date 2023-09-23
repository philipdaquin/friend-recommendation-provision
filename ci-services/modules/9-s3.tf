resource "aws_s3_bucket" "bucket" {
    bucket = "Jenkins's artifact"

    tags = {
        Name = "Jenkin's Project"
    }
}