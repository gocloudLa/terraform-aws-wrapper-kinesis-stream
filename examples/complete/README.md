# Amazon Kinesis Stream Module 🚀

This example demonstrates a Terraform configuration for provisioning and managing Amazon Kinesis Data Streams using a reusable module.

## 🔧 What's Included

### Analysis of Terraform Configuration

#### Main Purpose
The main purpose is to create and configure Kinesis streams.

#### Key Features Demonstrated
- **Stream Creation**: Provisions Kinesis streams with configurable shard count, retention period, and stream mode (PROVISIONED or ON_DEMAND)
- **Enhanced Fan-Out Support**: Optionally creates a stream consumer to enable Enhanced Fan-Out for dedicated throughput per consumer
- **Encryption Configuration**: Supports KMS encryption for the stream using a specified KMS key
- **Shard Metrics Configuration**: Allows enabling shard-level metrics such as IncomingBytes and OutgoingBytes
- **Retention Management**: Configures how long data records remain available in the stream
- **Cross-Account Access Policy**: Optionally creates a resource policy to allow another AWS account to write or read from the stream

## 🚀 Quick Start

```bash
terraform init
terraform plan
terraform apply
```

## 🔒 Security Notes

⚠️ **Production Considerations**: 
- This example may include configurations that are not suitable for production environments
- Review and customize security settings, access controls, and resource configurations
- Ensure compliance with your organization's security policies
- Consider implementing proper monitoring, logging, and backup strategies

## 📖 Documentation

For detailed module documentation and additional examples, see the main [README.md](../../README.md) file. 