output "static_website_endpoint" {
  value = aws_s3_bucket_website_configuration.terraform_ashraf_static_website.website_endpoint
}
