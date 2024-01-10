variable "cluster_id" {
    type        = string
    description = "cluster name"
}

variable "node_type" {
    type    = string
    default = null
}

# variable "num_cache_nodes" {
#     type        = number
#     default     = null
#     description = "For Redis, this value must be 1. For Memcached, this value must be between 1 and 40."
# }

variable "parameter_group_name" {
    type    = string
    default = null
}

variable "apply_immediately" {
    type    = bool
    default = false
}

variable "availability_zone" {
    type    = string
    default = "us-east-1a"
}

# variable "az_mode" {
#     type        = string
#     default     = null
#     description = "Memcached only. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1."
# }

variable "engine_version" {
    type    = string
    default = null
}

variable "final_snapshot_identifier" {
    type        = string
    default     = null
    description = "redis only"
}

variable "maintenance_window" {
    type        = string
    default     = null
    description = "The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period."
}

variable "notification_topic_arn" {
    type        = string
    default     = null
    description = "ARN of an SNS topic to send ElastiCache notifications to"
}

# variable "preferred_availability_zone" {
#     type        = string
#     default     = null
#     description = "memcached only"
# }

variable "replication_group_id" {
    type    = string
    default = null
}

variable "security_group_ids" {
    type    = list(string)
    default = []
}

variable "subnet_ids" {
    type    = list(string)
    default = []
}

# Log config is redis only

variable "log_destination" {
    type    = string
    default = null
}

variable "log_destination_type" {
    type    = string
    default = "cloudwatch-logs"
}

variable "log_format" {
    type    = string
    default = "json"
}

variable "log_type" {
    type    = string
    default = "engine-log"
}

variable "tags" {
    type    = map
    default = {}
}