variable "cluster_id" {
    type        = string
    description = "cluster name"
}

variable "node_type" {
    type    = string
    default = null
}

variable "num_cache_nodes" {
    type        = number
    default     = null
    description = "For Memcached, this value must be between 1 and 40."
}

variable "parameter_group_name" {
    type    = string
    default = null
}

variable "apply_immediately" {
    type    = bool
    default = false
}

variable "preferred_availability_zones" {
    type    = list(string)
    default = null
}

variable "az_mode" {
    type        = string
    default     = null
    description = "Memcached only. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1."
}

variable "engine_version" {
    type    = string
    default = null
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

variable "security_group_ids" {
    type    = list(string)
    default = []
}

variable "subnet_ids" {
    type    = list(string)
    default = []
}

variable "tags" {
    type    = map
    default = {}
}