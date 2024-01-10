locals {
    enable_log_config = var.log_destination != null ? toset(["1"]) : toset([])
}

resource "aws_elasticache_subnet_group" "main" {
    name        = "${var.cluster_id}-subnet-group"
    description = "Managed by RapidCloud"
    subnet_ids  = var.subnet_ids
    tags        = var.tags
}

resource "aws_elasticache_cluster" "main" {
    cluster_id                  = var.cluster_id
    engine                      = var.replication_group_id == null ? "redis" : null
    node_type                   = var.node_type
    num_cache_nodes             = var.replication_group_id == null ? 1 : null
    parameter_group_name        = var.parameter_group_name
    apply_immediately           = var.apply_immediately
    availability_zone           = var.availability_zone
    engine_version              = var.engine_version
    final_snapshot_identifier   = var.final_snapshot_identifier
    maintenance_window          = var.maintenance_window
    notification_topic_arn      = var.notification_topic_arn
    replication_group_id        = var.replication_group_id
    security_group_ids          = var.security_group_ids
    subnet_group_name           = resource.aws_elasticache_subnet_group.main.name
    tags                        = var.tags

    dynamic "log_delivery_configuration" {
        for_each = local.enable_log_config
        content {
            destination      = var.log_destination
            destination_type = var.log_destination_type
            log_format       = var.log_format
            log_type         = var.log_type
        }
    }
}