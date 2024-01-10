resource "aws_elasticache_subnet_group" "main" {
    name        = "${var.cluster_id}-subnet-group"
    description = "Managed by RapidCloud"
    subnet_ids  = var.subnet_ids
    tags        = var.tags
}

resource "aws_elasticache_cluster" "main" {
    cluster_id                   = var.cluster_id
    engine                       = "memcached"
    node_type                    = var.node_type
    num_cache_nodes              = var.num_cache_nodes
    parameter_group_name         = var.parameter_group_name
    apply_immediately            = var.apply_immediately
    preferred_availability_zones = var.preferred_availability_zones
    az_mode                      = var.az_mode
    engine_version               = var.engine_version
    maintenance_window           = var.maintenance_window
    notification_topic_arn       = var.notification_topic_arn
    security_group_ids           = var.security_group_ids
    subnet_group_name            = resource.aws_elasticache_subnet_group.main.name
    tags                         = var.tags
}