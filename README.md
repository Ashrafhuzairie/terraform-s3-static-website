# 🌐 Terraform S3 Static Website Project (AWS)

This project provisions an Amazon S3 bucket configured for static website hosting and deploys a professional HTML & CSS website using Terraform.
It is designed as a beginner-friendly Infrastructure-as-Code (IaC) project, suitable for learning, practice, and portfolio showcase.

# 📁 Project Overview

-  Define cloud provider and region

- Create Amazon S3 bucket with unique name

- Enable S3 static website hosting

- Configure public read access

- Upload static website files (HTML & CSS)

- Output public website endpoint

## What This Project Creates

### provider.tf

- Defines the cloud provider (AWS)

- Terraform version ~> 1.7

- Configures AWS Region

- ap-southeast-1 (Singapore)

## s3.tf

- Create Amazon S3 Bucket

    - Bucket name includes random suffix to ensure global uniqueness

    - Example:

        - terraform-ashraf-static-website-xxxx

- S3 Static Website Configuration

    - Index document:

        - index.html

- Public Access Configuration

    - Disables S3 public access blocks

    - Allows public bucket policy for website access

- S3 Bucket Policy

    - Grants public read (s3:GetObject)

    - Applies to all objects in the bucket (/*)

- Upload Static Website Files

    - index.html

    - styles.css

    - Correct content types:

        - text/html

        - text/css

## outputs.tf

- Outputs the static website endpoint after deployment

    - Example:

        - http://<bucket-name>.s3-website-ap-southeast-1.amazonaws.com


## AWS Console

### S3 Bucket

<p align="center"> <img src="docs/images/S3 Bucket.png" width="800" /> </p> 

### Static Website Hosting

<p align="center"> <img src="docs/images/S3 Website Config.png" width="800" /> </p>

### Bucket Policy (Public Read)

<p align="center"> <img src="docs/images/S3 Bucket Policy.png" width="800" /> </p>

### Static Website (Browser)

<p align="center"> <img src="docs/images/Static Website Browser - 1.png" width="800" /> </p>

<p align="center"> <img src="docs/images/Static Website Browser - 2.png" width="800" /> </p>

## Access the Website

- static_website_endpoint = http://terraform-ashraf-static-website-bd6661f4.s3-website-ap-southeast-1.amazonaws.com/#deploy

## Cleanup (Destroy Resources)

``` bash
terraform destroy
```

## ✅ Key Learning Outcomes

- Understand Amazon S3 static website hosting

- Learn how public access works in S3 (bucket policy vs public access block)

- Upload static files using aws_s3_object

- Manage MIME types (content_type) correctly

- Use Terraform outputs to expose infrastructure endpoints

- Apply Infrastructure-as-Code best practices

- Follow standard Terraform workflow:

    - fmt

    - init

    - validate

    - plan

    - apply

    - destroy

## 👤 Author

- Ashraf Huzairie
- Cloud & Infrastructure Enthusiast

- GitHub: https://github.com/Ashrafhuzairie

## © License

- © Ashraf Huzairie. All rights reserved.