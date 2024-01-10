locals {
    enable_log_config = var.log_destination != null ? toset(["1"]) : toset([])
    user_group_id = var.user_group_id != null ? [var.user_group_id] : null
}

resource "aws_elasticache_subnet_group" "main" {
    name        = "${var.replication_group_id}-subnet-group"
    description = "Managed by RapidCloud"
    subnet_ids  = var.subnet_ids
    tags        = var.tags
}

resource "aws_elasticache_replication_group" "main" {
    replication_group_id       = var.replication_group_id
    description                = var.description
    apply_immediately          = var.apply_immediately
    at_rest_encryption_enabled = var.at_rest_encryption_enabled
    kms_key_id                 = var.kms_key_id
    automatic_failover_enabled = var.automatic_failover_enabled
    multi_az_enabled           = var.multi_az_enabled
    engine                     = "redis"
    engine_version             = var.engine_version
    final_snapshot_identifier  = var.final_snapshot_identifier
    node_type                  = var.node_type
    notification_topic_arn     = var.notification_topic_arn
    num_cache_clusters         = var.num_cache_clusters
    num_node_groups            = var.num_node_groups
    replicas_per_node_group    = var.replicas_per_node_group
    parameter_group_name       = var.parameter_group_name
    subnet_group_name          = resource.aws_elasticache_subnet_group.main.name
    security_group_ids         = var.security_group_ids
    transit_encryption_enabled = var.transit_encryption_enabled
    user_group_ids             = local.user_group_id
    tags                       = var.tags

    dynamic "log_delivery_configuration" {
        for_each = local.enable_log_config
        content {
            destination        = var.log_destination
            destination_type   = var.log_destination_type
            log_format         = var.log_format
            log_type           = var.log_type
        }
    }
}