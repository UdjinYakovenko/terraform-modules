output "kms_recovery_key_id" {
  value = aws_kms_key.recovery.id
}

output "kms_root_key_id" {
  value = aws_kms_key.root.id
}