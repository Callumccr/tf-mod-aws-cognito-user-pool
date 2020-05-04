# -----------------------------------------------------------------------------
# Ouputs: TF-MOD-AWS-COGNITO-USER-POOL
# -----------------------------------------------------------------------------

output "cognito_user_pool_id" {
  description = "The id of the user pool"
  value       = aws_cognito_user_pool.default.0.id
}

output "cognito_user_pool_arn" {
  description = "The ARN of the user pool"
  value       = aws_cognito_user_pool.default.0.arn
}

output "cognito_user_pool_endpoint" {
  description = "The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = aws_cognito_user_pool.default.0.endpoint
}

output "creation_date" {
  description = "The date the user pool was created."
  value       = aws_cognito_user_pool.default.0.endpoint
}

output "last_modified_date" {
  description = "The date the user pool was last modified."
  value       = aws_cognito_user_pool.default.0.endpoint
}

output "aws_cognito_user_group_name" {
  description = "The ids of the cognito user groups"
  value       = aws_cognito_user_group.default.*.name
}

output "aws_cognito_user_pool_client_id" {
  description = "The ids of the cognito user pool client"
  value       = aws_cognito_user_pool_client.default.0.id
}
