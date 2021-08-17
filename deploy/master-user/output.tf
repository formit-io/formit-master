output "master_user_access_key_id" {
  value = aws_iam_access_key.master.id
}

output "master_user_secret_access_key" {
  value = aws_iam_access_key.master.secret
  sensitive = true
}