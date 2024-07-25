resource "aws_elasticache_replication_group" "cache_cluster" {
  replication_group_id = var.cache_name
  node_type            = var.cache_node_type
  engine               = var.cache_engine
  engine_version       = var.cache_engine_version
  port                 = var.cache_port

  automatic_failover_enabled = true
  transit_encryption_enabled = true

  security_group_ids = [aws_security_group.cache_subnet_group.id]
  subnet_group_name  = aws_elasticache_subnet_group.cache_subnet_group.name

  depends_on = [aws_elasticache_subnet_group.cache_subnet_group]
}
