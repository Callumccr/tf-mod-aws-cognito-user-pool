## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| alias\_attributes | (Optional) - Attributes supported as an alias for this user pool. Possible values: phone\_number, email, or preferred\_username. Conflicts with username\_attributes. | `any` | n/a | yes |
| create\_auth\_challenge | (Optional) - The ARN of the lambda creating an authentication challenge. | `any` | n/a | yes |
| custom\_message | (Optional) - A custom Message AWS Lambda trigger. | `any` | n/a | yes |
| define\_auth\_challenge | (Optional) - Defines the authentication challenge. | `any` | n/a | yes |
| minimum\_length | (Optional) - The minimum length of the password policy that you have set. | `any` | n/a | yes |
| post\_authentication | (Optional) - A post-authentication AWS Lambda trigger. | `any` | n/a | yes |
| pre\_authentication | (Optional) - A pre-authentication AWS Lambda trigger. | `any` | n/a | yes |
| pre\_sign\_up | (Optional) - A pre-registration AWS Lambda trigger. | `any` | n/a | yes |
| pre\_token\_generation | (Optional) - Allow to customize identity token claims before token generation. | `any` | n/a | yes |
| require\_lowercase | (Optional) - Whether you have required users to use at least one lowercase letter in their password. | `any` | n/a | yes |
| require\_numbers | (Optional) - Whether you have required users to use at least one number in their password. | `any` | n/a | yes |
| require\_symbols | (Optional) - Whether you have required users to use at least one symbol in their password. | `any` | n/a | yes |
| require\_uppercase | (Optional) - Whether you have required users to use at least one uppercase letter in their password. | `any` | n/a | yes |
| scheme\_name | (Optional) - The name of the attribute. | `any` | n/a | yes |
| temporary\_password\_validity\_days | (Optional) - (Optional) - In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator. | `any` | n/a | yes |
| user\_migration | (Optional) - The user migration Lambda config type. | `any` | n/a | yes |
| verify\_auth\_challenge\_response | (Optional) - Verifies the authentication challenge response. | `any` | n/a | yes |
| allow\_admin\_create\_user\_only | (Optional) - Set to True if only the administrator is allowed to create user profiles. Set to False if users can sign themselves up via an app. | `bool` | `true` | no |
| attribute\_data\_type | (Optional) - The attribute data type. Must be one of Boolean, Number, String, DateTime. | `string` | `""` | no |
| attributes | (Optional) - Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| auto\_verified\_attributes | (Optional) - (Optional) The attributes to be auto-verified. Possible values: email, phone\_number. | `list(string)` | `[]` | no |
| aws\_account\_id | The AWS account id of the provider being deployed to (e.g. 12345678). Autoloaded from account.tfvars | `string` | `""` | no |
| aws\_assume\_role\_arn | (Optional) - ARN of the IAM role when optionally connecting to AWS via assumed role. Autoloaded from account.tfvars. | `string` | `""` | no |
| aws\_assume\_role\_external\_id | (Optional) - The external ID to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_assume\_role\_session\_name | (Optional) - The session name to use when making the AssumeRole call. | `string` | `""` | no |
| aws\_region | The AWS region (e.g. ap-southeast-2). Autoloaded from region.tfvars. | `string` | `""` | no |
| challenge\_required\_on\_new\_device | (Optional) - Indicates whether a challenge is required on a new device. Only applicable to a new device. | `string` | `""` | no |
| create\_cognito\_identity\_pool | (Optional) - Whether to create the Cognito Identity Pool. Default is false | `bool` | `false` | no |
| create\_cognito\_user\_group | (Optional) - Whether to create the Cognito User Pool. Default is true | `bool` | `true` | no |
| create\_cognito\_user\_pool | (Optional) - Whether to create the Cognito User Pool. Default is true | `bool` | `true` | no |
| delimiter | (Optional) - Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| developer\_only\_attribute | (Optional) - Specifies whether the attribute type is developer only. | `bool` | `false` | no |
| device\_only\_remembered\_on\_user\_prompt | (Optional) - If true, a device is only remembered on user prompt. Default is false | `bool` | `false` | no |
| email\_message | (Optional) - The message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively. | `string` | `""` | no |
| email\_subject | (Optional) - The subject line for email messages. | `string` | `""` | no |
| email\_verification\_message | (Optional) - A string representing the email verification message. Conflicts with verification\_message\_template configuration block email\_message argument. | `string` | `""` | no |
| email\_verification\_subject | (Optional) - A string representing the email verification subject. Conflicts with verification\_message\_template configuration block email\_subject argument. | `string` | `""` | no |
| enabled | (Optional) - A Switch that decides whether to create the module. Default is true | `bool` | `true` | no |
| environment | (Optional) - Environment, e.g. 'dev', 'qa', 'staging', 'prod' | `string` | `""` | no |
| explicit\_auth\_flows | (Optional) - List of authentication flows (ADMIN\_NO\_SRP\_AUTH, CUSTOM\_AUTH\_FLOW\_ONLY, USER\_PASSWORD\_AUTH). | `list(string)` | <code><pre>[<br>  "USER_PASSWORD_AUTH"<br>]<br></pre></code> | no |
| external\_id | The external ID used in IAM role trust relationships. For more information about using external IDs, see How to Use an External ID When Granting Access to Your AWS Resources to a Third Party. | `string` | `""` | no |
| mfa\_configuration | (Optional) Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF. | `string` | `"OFF"` | no |
| mutable | (Optional) - Specifies whether the attribute can be changed once it has been created. | `bool` | `true` | no |
| name | (Optional) - Solution name, e.g. 'vault', 'consul', 'keycloak', 'k8s', or 'baseline' | `string` | `""` | no |
| namespace | (Optional) - Namespace, which could be your abbreviated product team, e.g. 'rci', 'mi', 'hp', or 'core' | `string` | `""` | no |
| number\_attribute\_constraints | (Optional) - Specifies the minimum maximum length of an attribute value of the string type. | <code><pre>object({<br>    min_length = number<br>    max_length = number<br>  })<br></pre></code> | <code><pre>{<br>  "max_length": 10,<br>  "min_length": 0<br>}<br></pre></code> | no |
| precedence | (Optional) - The precedence of the user group.. | `string` | `""` | no |
| required | (Optional) - Specifies whether a user pool attribute is required. If the attribute is required and the user does not provide a value, registration or sign-in will fail. | `bool` | `true` | no |
| role\_arn | (Optional) - The ARN of the IAM role to be associated with the user group. | `string` | `""` | no |
| sms\_message | (Optional) - The message template for SMS messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively. | `string` | `""` | no |
| sns\_caller\_arn | The ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume. | `string` | `""` | no |
| string\_attribute\_constraints | (Optional) - Specifies the minimum maximum length of an attribute value of the string type. | <code><pre>object({<br>    min_length = number<br>    max_length = number<br>  })<br></pre></code> | <code><pre>{<br>  "max_length": 32,<br>  "min_length": 6<br>}<br></pre></code> | no |
| tags | (Optional) - Additional tags | `map(string)` | `{}` | no |
| user\_group\_description | (Optional) - The description of the user group. | `string` | `""` | no |
| user\_group\_name | (Optional) - The name of the user group. | `string` | `""` | no |
| user\_pool\_name | (Optional) - The name of the user pool. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_cognito\_user\_group\_name | The ids of the cognito user groups |
| aws\_cognito\_user\_pool\_client\_id | The ids of the cognito user pool client |
| cognito\_user\_pool\_arn | The ARN of the user pool |
| cognito\_user\_pool\_endpoint | The endpoint name of the user pool. Example format: cognito-idp.REGION.amazonaws.com/xxxx\_yyyyy |
| cognito\_user\_pool\_id | The id of the user pool |
| creation\_date | The date the user pool was created. |
| last\_modified\_date | The date the user pool was last modified. |

