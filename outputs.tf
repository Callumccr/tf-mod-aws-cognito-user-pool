# -----------------------------------------------------------------------------
# Ouputs: TF-MOD-AWS-COGNITO-USER-POOL
# -----------------------------------------------------------------------------

output "user_pool_id" {
  description = "The id of the user pool"
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.id : ""
}

output "user_pool_arn" {
  description = "The ARN of the user pool"
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.arn : ""
}

output "user_pool_endpoint" {
  description = "The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx_yyyyy"
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.endpoint : ""
}

output "creation_date" {
  description = "The date the user pool was created."
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.endpoint : ""
}

output "last_modified_date" {
  description = "The date the user pool was last modified."
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.endpoint : ""
}


output "client_pool_id" {
  description = "The id of the user pool client."
  value       = var.create_cognito_user_pool == true ? aws_cognito_user_pool_client.default.0.id : ""
}


