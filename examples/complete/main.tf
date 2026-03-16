module "wrapper_kinesis_stream" {
  source = "../../"

  metadata = local.metadata

  kinesis_stream_parameters = {

    "provisioned" = {
      stream_mode = "PROVISIONED"
      shard_count = 2

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