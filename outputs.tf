output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the log group."
  value       = aws_cloudwatch_log_group.main.arn
}

output "name" {
  description = "The name of the log group."
  value       = aws_cloudwatch_log_group.main.name
}
