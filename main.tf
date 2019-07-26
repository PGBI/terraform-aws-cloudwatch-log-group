/**
 * The log group.
 */
resource "aws_cloudwatch_log_group" "main" {
  name              = var.no_name_prefix ? var.name : "${var.project.name_prefix}-${var.name}"
  kms_key_id        = var.kms_key_arn
  retention_in_days = var.retention_in_days
  tags              = var.project.tags
}
