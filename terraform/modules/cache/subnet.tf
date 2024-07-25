data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name       = "cache-sng-${var.cache_name}"
  subnet_ids = data.aws_subnets.private_subnets.ids
}
