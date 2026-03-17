module "wrapper_kinesis_stream" {
  source = "../../"

  metadata = local.metadata

  kinesis_stream_parameters = {

    "provisioned" = {
      stream_mode = "PROVISIONED"
      shard_count = 2

      max_record_size_in_kib = 2048 # (2KB), Default 1024 (1 KB), Max value: 10024 (Near to 10MB)

      # Encryption
      # encryption_type = "KMS" # Default KMS
      # kms_key_id = "alias/aws/kinesis" # Default AWS KMS for Kinesis

      # Policy to create cross-account access
      # create_policy = true # Default false
      # aws_account_policy_destination = "XXXXX" # Number of the account id
      # policy_actions = ["kinesis:DescribeStreamSummary", "kinesis:DescribeStreamSummary"] # Custom Actions
    }
    "on-demand" = {
      retention_period = 720 # 30 dias
    }
  }
  kinesis_stream_defaults = var.kinesis_stream_defaults
}