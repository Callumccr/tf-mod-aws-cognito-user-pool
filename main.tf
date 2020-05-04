resource "aws_cognito_user_pool" "default" {
  count                      = var.enabled && var.create_cognito_user_pool == true ? 1 : 0
  name                       = module.label.id
  auto_verified_attributes   = var.auto_verified_attributes
  email_verification_subject = var.email_verification_subject
  email_verification_message = var.email_verification_message

  dynamic "admin_create_user_config" {
    for_each = list(var.email_message) == [] ? [] : list(var.email_message)
    iterator = invite_message_template
    content {
      invite_message_template {
        email_message = var.email_message
        email_subject = var.email_subject
        sms_message   = var.sms_message
      }
    }
  }

  dynamic "schema" {
    for_each = list(var.attribute_data_type) == [] ? [] : list(var.attribute_data_type)
    iterator = attribute_data_type
    content {
      attribute_data_type      = var.attribute_data_type
      developer_only_attribute = var.developer_only_attribute
      mutable                  = var.mutable
      name                     = element(var.auto_verified_attributes, 0)
      required                 = var.required
      string_attribute_constraints {
        min_length = lookup(var.string_attribute_constraints, "min_length", "")
        max_length = lookup(var.string_attribute_constraints, "max_length", "")
      }
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
  user_pool_id = var.create_cognito_user_pool == true ? aws_cognito_user_pool.default.0.id : var.user_pool_id
  description  = var.user_group_description
  precedence   = var.precedence
  role_arn     = var.role_arn
}
