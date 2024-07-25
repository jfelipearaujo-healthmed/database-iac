resource "aws_security_group" "cache_security_group" {
  name   = "cache-sg-${var.cache_name}"
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    from_port = var.cache_port
    to_port   = var.cache_port
    protocol  = "tcp"
    cidr_blocks = [
      data.aws_vpc.vpc.cidr_block
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  lifecycle {
    create_before_destroy = true
  }
}
