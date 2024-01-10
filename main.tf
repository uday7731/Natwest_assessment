# Define variables
variable "region" {
  description = "AWS region"
  default     = "us-east-1" 
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Key pair name for EC2 instance"
  default     = "your-key-pair"
}

variable "bucket_name" {
  description = "S3 bucket name for static website"
  default     = "your-unique-bucket-name"
}

# AWS provider configuration
provider "aws" {
  region = var.region
}

# EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxx"
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  tags = {
    Name = "EC2Instance"
  }
}

# S3 bucket for static website content
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# Output the public IP of the EC2 instance
output "ec2_instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

# Output the website bucket URL
output "website_bucket_url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}
