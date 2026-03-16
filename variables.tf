/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

variable "metadata" {
  type = any
}

/*----------------------------------------------------------------------*/
/* Kinesis Stream | Variable Definition                                 */
/*----------------------------------------------------------------------*/
variable "kinesis_stream_parameters" {
  type        = any
  description = "Kinesis Stream parameteres"
  default     = {}
}

variable "kinesis_stream_defaults" {
  type        = any
  description = "Kinesis Stream default parameteres"
  default     = {}
}