resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "terraform-ashraf-static-website" {

  bucket = "terraform-ashraf-static-website-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket_public_access_block" "allow_public" {
  bucket                  = aws_s3_bucket.terraform-ashraf-static-website.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "terraform_ashraf_static_website_public_read" {
  bucket = aws_s3_bucket.terraform-ashraf-static-website.id

  depends_on = [aws_s3_bucket_public_access_block.allow_public]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = {
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.terraform-ashraf-static-website.arn}/*"
    }
    }
  )

}

resource "aws_s3_bucket_website_configuration" "terraform_ashraf_static_website" {
  bucket = aws_s3_bucket.terraform-ashraf-static-website.id

  index_document {
    suffix = "index.html"

  }
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.terraform-ashraf-static-website.id
  key          = "index.html"
  source       = "build/index.html"
  etag         = filemd5("build/index.html")
  content_type = "text/html"
}


resource "aws_s3_object" "styles_css" {
  bucket       = aws_s3_bucket.terraform-ashraf-static-website.id
  key          = "styles.css"
  source       = "build/styles.css"
  etag         = filemd5("build/styles.css")
  content_type = "text/css"
}
