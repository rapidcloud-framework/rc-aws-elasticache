variable "replication_group_id" {
    type = string
}

variable "description" {
    type    = string
    default = ""
}

variable "apply_immediately" {
    type    = bool
    default = false
}

variable "at_rest_encryption_enabled" {
    type    = bool
    default = false
}

variable "kms_key_id" {
    type        = string
    default     = null
    description = "The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at_rest_encryption_enabled = true."
}

variable "automatic_failover_enabled" {
    type        = bool
    default     = false
    description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false."
}

variable "multi_az_enabled" {
    type        = bool
    default     = false
    description = "Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled. Defaults to false."
}

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

variable "node_type" {
    type    = string
    default = null
}

variable "notification_topic_arn" {
    type        = string
    default     = null
    description = "ARN of an SNS topic to send ElastiCache notifications to"
}

variable "num_cache_clusters" {
    type        = number
    default     = null
    description = "set if using redis cluster mode disabled, must be at least 2 if Multi-AZ is enabled"
}

variable "num_node_groups" {
    type = number
    default = null
    description = "Number of node groups (shards) for this Redis replication group, set if using redis cluster mode enabled"
}

variable "replicas_per_node_group" {
    type = number
    default = null
    description = "0 to 5, redis cluster mode enabled"
}

variable "parameter_group_name" {
    type    = string
    default = null
}

variable "transit_encryption_enabled" {
    type = bool
    default = null
}

variable "user_group_id" {
    type = string
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

# Log config

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