# -----------------------------------------------------------------------------
# Variables: Common AWS Provider - Autoloaded from Terragrunt
# -----------------------------------------------------------------------------

variable "aws_region" {
  description = "The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars."
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars"
  type        = string
  default     = ""
}

variable "aws_assume_role_arn" {
  description = "(Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars."
  type        = string
  default     = ""
}

variable "aws_assume_role_session_name" {
  description = "(Optional) - The session name to use when making the AssumeRole call."
  type        = string
  default     = ""
}

variable "aws_assume_role_external_id" {
  description = "(Optional) - The external ID to use when making the AssumeRole call."
  type        = string
  default     = ""
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-AWS-COGNITO-USER-POOL
# -----------------------------------------------------------------------------

// Conditional Triggers
variable "enabled" {
  description = "(Optional) - A Switch that decides whether to create the module. Default is false"
  type        = bool
  default     = false
}

variable "create_cognito_user_pool" {
  description = "(Optional) - Whether to create the Cognito User Pool. Default is false"
  type        = bool
  default     = false
}

variable "create_cognito_user_group" {
  description = "(Optional) - Whether to create the Cognito User Pool. Default is false"
  type        = bool
  default     = false
}

// Resource: aws_cognito_user_pool
variable "user_pool_name" {
  description = "(Optional) - The name of the user pool."
  type        = string
  default     = ""
}

variable "alias_attributes" {
  description = "(Optional) - Attributes supported as an alias for this user pool. Possible values: phone_number, email, or preferred_username. Conflicts with username_attributes."
  type        = any
  default     = null
}

variable "auto_verified_attributes" {
  description = "(Optional) - (Optional) The attributes to be auto-verified. Possible values: email, phone_number."
  type        = list(string)
  default     = []
}

variable "email_verification_subject" {
  type        = string
  description = "(Optional) - A string representing the email verification subject. Conflicts with verification_message_template configuration block email_subject argument."
  default     = ""
}

variable "email_verification_message" {
  type        = string
  description = "(Optional) - A string representing the email verification message. Conflicts with verification_message_template configuration block email_message argument."
  default     = ""
}

variable "mfa_configuration" {
  type        = string
  description = "(Optional) Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF."
  default     = "OFF"
}
# Valid values:
# OFF - MFA tokens are not required.
# ON - MFA is required for all users to sign in. Requires at least one of sms_configuration or software_token_mfa_configuration to be configured.
# OPTIONAL - MFA will be required only for individual users who have MFA enabled. Requires at least one of sms_configuration or software_token_mfa_configuration to be configured.



// schema nested {} - (Optional) - A container with the schema attributes of a user pool. Schema attributes from the standard attribute set only need to be specified if they are different from the default configuration. Maximum of 50 attributes.
# NOTE: When defining an attribute_data_type of String or Number, the respective attribute constraints configuration block (e.g string_attribute_constraints or number_attribute_contraints) is required to prevent recreation of the Terraform resource. This requirement is true for both standard (e.g. name, email) and custom schema attributes.
variable "attribute_data_type" {
  type        = string
  description = "(Optional) - The attribute data type. Must be one of Boolean, Number, String, DateTime."
  default     = ""
}

variable "developer_only_attribute" {
  type        = bool
  description = "(Optional) - Specifies whether the attribute type is developer only."
  default     = false
}

variable "mutable" {
  type        = bool
  description = "(Optional) - Specifies whether the attribute can be changed once it has been created."
  default     = true
}

variable "scheme_name" {
  type        = any
  description = "(Optional) - The name of the attribute."
  default     = null
}

variable "number_attribute_constraints" {
  description = "(Optional) - Specifies the minimum maximum length of an attribute value of the string type."
  type = object({
    min_length = number
    max_length = number
  })
  default = {
    min_length = 0
    max_length = 10
  }
}

variable "required" {
  type        = bool
  description = "(Optional) - Specifies whether a user pool attribute is required. If the attribute is required and the user does not provide a value, registration or sign-in will fail."
  default     = true
}

variable "string_attribute_constraints" {
  description = "(Optional) - Specifies the minimum maximum length of an attribute value of the string type."
  type = object({
    min_length = number
    max_length = number
  })
  default = {
    min_length = 6
    max_length = 32
  }
}

// password_policy nested {} - (Optional) - A container for information about the user pool password policy.
variable "minimum_length" {
  type        = any
  description = "(Optional) - The minimum length of the password policy that you have set."
  default     = null
}

variable "require_lowercase" {
  type        = any
  description = "(Optional) - Whether you have required users to use at least one lowercase letter in their password."
  default     = null
}

variable "require_numbers" {
  type        = any
  description = "(Optional) - Whether you have required users to use at least one number in their password."
  default     = null
}

variable "require_symbols" {
  type        = any
  description = "(Optional) - Whether you have required users to use at least one symbol in their password."
  default     = null
}

variable "require_uppercase" {
  type        = any
  description = "(Optional) - Whether you have required users to use at least one uppercase letter in their password."
  default     = null
}

variable "temporary_password_validity_days" {
  type        = any
  description = "(Optional) - (Optional) - In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator."
  default     = null
}
//

// lambda_config nested {} - (Optional) - A container for the AWS Lambda triggers associated with the user pool.
variable "create_auth_challenge" {
  type        = any
  description = "(Optional) - The ARN of the lambda creating an authentication challenge."
  default     = null
}

variable "custom_message" {
  type        = any
  description = "(Optional) - A custom Message AWS Lambda trigger."
  default     = null
}

variable "define_auth_challenge" {
  type        = any
  description = "(Optional) - Defines the authentication challenge."
  default     = null
}

variable "post_authentication" {
  type        = any
  description = "(Optional) - A post-authentication AWS Lambda trigger."
  default     = null
}

variable "pre_authentication" {
  type        = any
  description = "(Optional) - A pre-authentication AWS Lambda trigger."
  default     = null
}

variable "pre_sign_up" {
  type        = any
  description = "(Optional) - A pre-registration AWS Lambda trigger."
  default     = null
}

variable "pre_token_generation" {
  type        = any
  description = "(Optional) - Allow to customize identity token claims before token generation."
  default     = null
}

variable "user_migration" {
  type        = any
  description = "(Optional) - The user migration Lambda config type."
  default     = null
}

variable "verify_auth_challenge_response" {
  type        = any
  description = "(Optional) - Verifies the authentication challenge response."
  default     = null
}
//

// admin_create_user_config nested {}
variable "allow_admin_create_user_only" {
  description = "(Optional) - Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app."
  type        = bool
  default     = true
}

// invite_message_template nested {}
variable "email_message" {
  description = "(Optional) - The message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  type        = string
  default     = ""
}

variable "email_subject" {
  description = "(Optional) - The subject line for email messages."
  type        = string
  default     = ""
}

variable "sms_message" {
  description = "(Optional) - The message template for SMS messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
  type        = string
  default     = ""
}
//

// device_configuration nested {}
variable "challenge_required_on_new_device" {
  description = "(Optional) - Indicates whether a challenge is required on a new device. Only applicable to a new device."
  type        = string
  default     = ""
}

variable "device_only_remembered_on_user_prompt" {
  description = "(Optional) - If true, a device is only remembered on user prompt. Default is false"
  type        = bool
  default     = false
}

// sms_configuration nested {} - (Optional) - Configuration block for Short Message Service (SMS) settings. 
# Detailed below. These settings apply to SMS user verification and SMS Multi-Factor Authentication (MFA). 
# Due to Cognito API restrictions, the SMS configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will ignore the removal of this configuration by disabling drift detection. 
# To force resource recreation after this configuration has been applied, see the taint command.
variable "external_id" {
  description = "The external ID used in IAM role trust relationships. For more information about using external IDs, see How to Use an External ID When Granting Access to Your AWS Resources to a Third Party."
  type        = string
  default     = ""
}

variable "sns_caller_arn" {
  description = "The ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume."
  type        = string
  default     = ""
}
//

// Resource: aws_cognito_user_pool_group

variable "user_group_name" {
  type        = string
  description = "(Optional) - The name of the user group."
  default     = ""
}

variable "user_group_description" {
  type        = string
  description = "(Optional) - The description of the user group."
  default     = ""
}

variable "precedence" {
  type        = number
  description = "(Optional) - The precedence of the user group."
  default     = 0
}

variable "role_arn" {
  type        = string
  description = "(Optional) - The ARN of the IAM role to be associated with the user group."
  default     = ""
}

//Resource: aws_cognito_user_pool_client

variable "explicit_auth_flows" {
  type        = list(string)
  description = "(Optional) - List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH)."
  default     = ["USER_PASSWORD_AUTH"]
}

# -----------------------------------------------------------------------------
# Variables: TF-MOD-LABEL
# -----------------------------------------------------------------------------

variable "namespace" {
  type        = string
  default     = ""
  description = "(Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "(Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod'"
}

variable "name" {
  type        = string
  default     = ""
  description = "(Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "(Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "(Optional) - Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "(Optional) - Additional tags"
}
