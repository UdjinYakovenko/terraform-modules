resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_s3_bucket_public_access_block" "access_bucket" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket" "bucket" {
  bucket        = var.s3_bucket_name
  acl           = var.s3_bucket_acl
  force_destroy = var.s3_bucket_force_destroy

    versioning {
      enabled    = var.versioning
  }
   
   server_side_encryption_configuration {
        rule {
                 apply_server_side_encryption_by_default {
                 kms_master_key_id = aws_kms_key.mykey.arn
                 sse_algorithm = "aws:kms"
      }
    }
  }
}