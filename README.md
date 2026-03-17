# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform AWS Kinesis Stream Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-kinesis-stream/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-kinesis-stream.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-kinesis-stream.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-kinesis-stream/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The AWS Kinesis Stream Terraform Wrapper defines the configuration required to provision and manage Amazon Kinesis Data Streams.

### ✨ Features




## 🚀 Quick Start
```hcl
  "provisioned" = {
    stream_mode = "PROVISIONED"
    shard_count = 2

    max_record_size_in_kib = 2048 # (2KB), Default 1024 (1 KB), Max value: 10024 (Near to 10MB)

    # Encryption
    # encryption_type = "KMS" # Default KMS
    # kms_key_id      = "alias/aws/kinesis" # Default AWS KMS for Kinesis

    # Policy to create cross-account access
    # create_policy                  = true # Default false
    # aws_account_policy_destination = "XXXXX" # Number of the account id
    # policy_actions                 = ["kinesis:DescribeStreamSummary", "kinesis:DescribeStreamSummary"] # Custom Actions
  }
  "on-demand" = {
    retention_period = 720 # 30 dias
  }
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name                           | Description                                                                                                                                                                                                             | Type           | Default                              | Required |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------------------ | -------- |
| name                           | A name to identify the stream. This is unique to the AWS account and region the Stream is created in                                                                                                                    | `string`       | `${local.common_name}-${each.key}`   | no       |
| shard_count                    | The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream | `number`       | `1`                                  | no       |
| retention_period               | Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24                                                      | `number`       | `24`                                 | no       |
| shard_level_metrics            | A list of shard-level CloudWatch metrics which can be enabled for the stream                                                                                                                                            | `list(string)` | `["IncomingBytes", "OutgoingBytes"]` | no       |
| enforce_consumer_deletion      | A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error                                                                              | `bool`         | `true`                               | no       |
| encryption_type                | The encryption type to use. The only acceptable values are NONE or KMS                                                                                                                                                  | `string`       | `"KMS"`                              | no       |
| kms_key_id                     | The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis                                                                  | `string`       | `"alias/aws/kinesis"`                | no       |
| stream_mode                    | Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND. If `ON_DEMAND` is used, then `shard_count` is ignored                                                                               | `string`       | `null`                               | no       |
| max_record_size_in_kib         | The maximum size for a single data record in KiB. The minimum value is 1024. The maximum value is 10240.                                                                                                                | `number`       | `null`                               | no       |
| create_policy                  | Whether to create a resource policy for the Kinesis stream                                                                                                                                                              | `boolean`      | `false`                              | no       |
| aws_account_policy_destination | AWS account ID that will be granted permissions in the Kinesis stream resource policy for cross-account access                                                                                                          | `string`       | `null`                               | no       |
| policy_actions                 | List of Kinesis actions allowed for the destination AWS account in the stream resource policy                                                                                                                           | `list(string)` | `null`                               | no       |
| enable_enhanced_fan_out        | Whether to create a resource kinesis stream consume                                                                                                                                                                     | `boolean`      | `false`                              | no       |
| tags                           | A map of tags to assign to resources.                                                                                                                                                                                   | `map`          | `{}`                                 | no       |








---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 