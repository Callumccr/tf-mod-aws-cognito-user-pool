resource "aws_cognito_user_pool" "default" {
  count                      = var.enabled && var.create_cognito_user_pool == true ? 1 : 0
  name                       = module.label.id
  auto_verified_attributes   = var.auto_verified_attributes
  email_verification_subject = var.email_verification_subject
  email_verification_message = var.email_verification_message

  admin_create_user_config {
    invite_message_template {
      email_message = var.email_message
      email_subject = var.email_subject
      sms_message   = var.sms_message
    }
  }

  schema {
    attribute_data_type      = var.attribute_data_type
    developer_only_attribute = var.developer_only_attribute
    mutable                  = var.mutable
    name                     = element(var.auto_verified_attributes, 0)
    required                 = var.required
    string_attribute_constraints = {
      min_length = lookup(var.string_attribute_constraints, "min_length", "")
      min_length = lookup(var.string_attribute_constraints, "max_length", "")
    }
  }
  tags = module.label.tags
}

resource "aws_cognito_user_pool_client" "default" {
  count               = var.enabled && var.create_cognito_user_pool == true && var.explicit_auth_flows != null ? 1 : 0
  name                = module.label.id
  user_pool_id        = aws_cognito_user_pool.default.0.id
  explicit_auth_flows = var.explicit_auth_flows
}

resource "aws_cognito_user_group" "default" {
  count        = var.enabled && var.create_cognito_user_group ? 1 : 0
  name         = var.user_group_name
  user_pool_id = aws_cognito_user_pool.default.0.id
  description  = var.user_group_description
}

# resource "aws_cognito_identity_pool" "default" {
#   count                            = var.enabled ? 1 : 0
#   identity_pool_name               = "${var.context.namespace} identity"
#   allow_unauthenticated_identities = var.allow_unauthenticated_identities

#   cognito_identity_providers {
#     client_id               = aws_cognito_user_pool_client.default.0.id
#     provider_name           = aws_cognito_user_pool.default.0.endpoint
#     server_side_token_check = var.server_side_token_check
#   }
# }

# resource "aws_iam_role" "authenticated" {
#   name               = "${module.label.id}${var.delimiter}authenticated"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "cognito-identity.amazonaws.com"
#       },
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.default.0.id}"
#         },
#         "ForAnyValue:StringLike": {
#           "cognito-identity.amazonaws.com:amr": "authenticated"
#         }
#       }
#     }
#   ]
# }
# EOF

# }

# resource "aws_iam_role_policy" "authenticated" {
#   name   = "${module.label.id}${var.delimiter}authenticated${var.delimiter}policy"
#   role   = aws_iam_role.authenticated.id
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "mobileanalytics:PutEvents",
#         "cognito-sync:*",
#         "cognito-identity:*"
#       ],
#       "Resource": [
#         "*"
#       ]
#     }
#   ]
# }
# EOF

# }

# resource "aws_iam_role" "unauthenticated" {
#   name               = "${module.label.id}${var.delimiter}unauthenticated"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Federated": "cognito-identity.amazonaws.com"
#       },
#       "Action": "sts:AssumeRoleWithWebIdentity",
#       "Condition": {
#         "StringEquals": {
#           "cognito-identity.amazonaws.com:aud": "${aws_cognito_identity_pool.default.0.id}"
#         },
#         "ForAnyValue:StringLike": {
#           "cognito-identity.amazonaws.com:amr": "unauthenticated"
#         }
#       }
#     }
#   ]
# }
# EOF

# }

# resource "aws_iam_role_policy" "unauthenticated" {
#   name = "${module.label.id}${var.delimiter}unauthenticated${var.delimiter}policy"
#   role = aws_iam_role.unauthenticated.id

#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#         "mobileanalytics:PutEvents",
#         "cognito-sync:*"
#       ],
#       "Resource": [
#         "*"
#       ]
#     }
#   ]
# }
# EOF
# }

# resource "aws_cognito_identity_pool_roles_attachment" "main" {
#   identity_pool_id = aws_cognito_identity_pool.default.0.id

#   roles = {
#     "authenticated"   = aws_iam_role.authenticated.arn
#     "unauthenticated" = aws_iam_role.unauthenticated.arn
#   }
# }

