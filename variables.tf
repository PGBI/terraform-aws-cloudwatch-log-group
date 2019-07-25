variable "project" {
  description = <<EOF
    Reference to a [\"project\"](https://registry.terraform.io/modules/PGBI/project/aws/) module."
EOF
}

variable "name" {
  description = "The name of the log group."
  type        = "string"
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group."
  default     = 90
}

variable "no_name_prefix" {
  description = "If true, the input name won't be prefixed with the workspace or project name."
  default     = false
}
