# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-COGNITO
# -----------------------------------------------------------------------------

output "cognito_user_pool_id" {
  description = "The id of the user pool"
  value       = aws_cognito_user_pool.default.0.id
}

output "cognito_user_pool_arn" {
  description = "The ARN of the user pool"
  value       = aws_cognito_user_pool.default.0.arn
}

output "aws_cognito_user_group_name" {
  description = "The ids of the cognito user groups"
  value       = aws_cognito_user_group.default.*.name
}

output "aws_cognito_user_pool_client_id" {
  description = "The ids of the cognito user pool client"
  value       = aws_cognito_user_pool_client.default.0.id
}

output "aws_cognito_identity_pool_id" {
  description = "The ids of the cognito identity pool"
  value       = aws_cognito_identity_pool.default.0.id
}

output "aws_cognito_identity_pool_arn" {
  description = "The ARNs of the cognito identity pool"
  value       = aws_cognito_identity_pool.default.0.arn
}

output "cognito_user_pool_endpoint" {
  description = "The endpoint of the user pool"
  value       = aws_cognito_user_pool.default.0.endpoint
}
