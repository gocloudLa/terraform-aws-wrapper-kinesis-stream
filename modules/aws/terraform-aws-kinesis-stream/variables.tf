variable "name" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
  type        = string
  default     = ""
}

variable "shard_count" {
  description = "The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream."
  type        = number
  default     = null
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24."
  type        = number
  default     = null
}

variable "shard_level_metrics" {
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream."
  type        = list(string)
  default     = []
}

variable "enforce_consumer_deletion" {
  description = "A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error."
  type        = bool
  default     = null
}

variable "encryption_type" {
  description = "The encryption type to use. The only acceptable values are NONE or KMS."
  type        = string
  default     = ""
}

variable "kms_key_id" {
  description = "The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis."
  type        = string
  default     = ""
}

variable "stream_mode" {
  description = "Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND. If `ON_DEMAND` is used, then `shard_count` is ignored."
  type        = string
  default     = ""
}

variable "max_record_size_in_kib" {
  description = "The maximum size for a single data record in KiB. The minimum value is 1024. The maximum value is 10240."
  type        = number
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "create_policy" {
  description = "Whether to create a resource policy for the Kinesis stream."
  type        = bool
  default     = null
}

variable "aws_account_policy_destination" {
  description = "AWS account ID that will be granted permissions in the Kinesis stream resource policy for cross-account access."
  type        = string
  default     = null
}

variable "policy_actions" {
  description = "List of Kinesis actions allowed for the destination AWS account in the stream resource policy."
  type        = list(string)
  default     = []
}

variable "enable_enhanced_fan_out" {
  description = "Whether to create a resource kinesis_stream_consume."
  type        = bool
  default     = null
}