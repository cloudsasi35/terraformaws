resource "aws_s3_bucket" "mybucket" {
  bucket = "sasikumartestbucket30012025"

  tags = {
    Name = "sasikumar30012025"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "mybucketacl" {
  bucket = aws_s3_bucket.mybucket.id
  acl = "public-read"
}

resource "aws_s3_bucket_policy" "mybucketpolicy" {
  bucket = aws_s3_bucket.mybucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "s3:GetObject"
        Effect = "Allow"
        Resource = "arn:aws:s3:::${aws_s3_bucket.mybucket.bucket}/*"
        Principal = "*"
      }
    ]
  })
}