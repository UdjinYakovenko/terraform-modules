#resource "aws_secretsmanager_secret" "example" {
#  name                    = "rds-admin"
#  description             = "RDS Admin password"
#  recovery_window_in_days = 0
  #kms_key_id = aws_kms_key.examplekms.arn
#}

#resource "aws_secretsmanager_secret_version" "secret" {
#  secret_id               = aws_secretsmanager_secret.example.id
#  secret_string           = random_password.password.result
#}

#resource "random_password" "password" {
#  length                  = 16
#  special                 = true
#  override_special        = "!#$%^&*()-_=+[]{}<>:?"
#}