module "kinesis_stream" {
  source = "./modules/aws/terraform-aws-kinesis-stream"

  for_each = var.kinesis_stream_parameters

  name                      = try(each.value.name, "${local.common_name}-${each.key}")
  enable_enhanced_fan_out   = try(each.value.enable_enhanced_fan_out, var.kinesis_stream_defaults.enable_enhanced_fan_out, false)
  enforce_consumer_deletion = try(each.value.enforce_consumer_deletion, var.kinesis_stream_defaults.enforce_consumer_deletion, true)
  encryption_type           = try(each.value.encryption_type, var.kinesis_stream_defaults.encryption_type, "KMS")
  kms_key_id                = try(each.value.kms_key_id, var.kinesis_stream_defaults.kms_key_id, "alias/aws/kinesis")
  max_record_size_in_kib    = try(each.value.max_record_size_in_kib, var.kinesis_stream_defaults.max_record_size_in_kib, 1024)
  retention_period          = try(each.value.retention_period, var.kinesis_stream_defaults.retention_period, 24)
  shard_count               = try(each.value.shard_count, var.kinesis_stream_defaults.shard_count, null)
  shard_level_metrics       = try(each.value.shard_level_metrics, var.kinesis_stream_defaults.shard_level_metrics, [
    "IncomingBytes",
    "OutgoingBytes"
  ])
  stream_mode                    = try(each.value.stream_mode, var.kinesis_stream_defaults.stream_mode, "ON_DEMAND")
  create_policy                  = try(each.value.create_policy, var.kinesis_stream_defaults.create_policy, false)
  aws_account_policy_destination = try(each.value.aws_account_policy_destination, var.kinesis_stream_defaults.aws_account_policy_destination, null)
  policy_actions                 = try(each.value.policy_actions, var.kinesis_stream_defaults.policy_actions, [])

  tags = merge(local.common_tags, try(each.value.tags, var.kinesis_stream_defaults.tags, null))
}