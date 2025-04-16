provider "aws" {
  region = "us-east-1"  # Region where the website will be hosted
}

resource "aws_s3_bucket" "website" {
  bucket = "my-website-bucket"  # Name of the storage space
  website {
    index_document = "index.html"  # The main page file of your website
  }
}

resource "aws_s3_bucket_object" "website_content" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"  # Name of your file
  source = "index.html"  # Path to the file on your computer (or GitHub repo)
  acl    = "public-read"  # Makes the website visible to everyone
}
