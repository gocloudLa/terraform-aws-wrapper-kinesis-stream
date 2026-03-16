resource "aws_kinesis_stream" "this" {
  name                      = var.name
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  shard_level_metrics       = var.shard_level_metrics
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id
  max_record_size_in_kib    = var.max_record_size_in_kib

  dynamic "stream_mode_details" {
    for_each = var.stream_mode != null ? ["true"] : []
    content {
      stream_mode = var.stream_mode
    }
  }

  tags = var.tags
}

resource "aws_kinesis_stream_consumer" "this" {
  count = local.enable_enhanced_fan_out ? 1 : 0

  name       = var.name
  stream_arn = aws_kinesis_stream.this.arn

  tags = var.tags
}

resource "aws_kinesis_resource_policy" "this" {
  count = local.create_policy ? 1 : 0

  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "writePolicy",
    Statement = [{
      Sid    = "writestatement",
      Effect = "Allow",
      Principal = {
        AWS = var.aws_account_policy_destination
      },
      Action   = var.policy_actions,
      Resource = "${aws_kinesis_stream.this.arn}"
    }]
  })
  resource_arn = aws_kinesis_stream.this.arn
}