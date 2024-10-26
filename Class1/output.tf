output bucket_info_1 {
  value = aws_s3_bucket.example.bucket
}
output bucket_info_2 {
  value = aws_s3_bucket.example.arn
}
output user_info {
  value = aws_iam_user.lb
  
}
output group_info {
  value = aws_iam_group.group
  
}