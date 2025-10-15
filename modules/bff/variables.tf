variable "function_name" {
  description = "The name of the lambda function."
  type        = string
}

variable "handler" {
  description = "The handler for the lambda function."
  type        = string
}

variable "runtime" {
  description = "The runtime for the lambda function."
  type        = string
  default     = "nodejs22.x"
}

variable "source_path" {
  description = "The path to the lambda function source code (zip file)."
  type        = string
  default     = null
}

variable "s3_bucket" {
  description = "The S3 bucket where the lambda source code is stored."
  type        = string
  default     = null
}

variable "s3_key" {
  description = "The S3 key for the lambda source code."
  type        = string
  default     = null
}

variable "s3_object_version" {
  description = "The version of the S3 object."
  type        = string
  default     = null
}

variable "timeout" {
  description = "The timeout for the lambda function."
  type        = number
  default     = 3
}

variable "memory_size" {
  description = "The memory size for the lambda function."
  type        = number
  default     = 128
}
