resource "random_password" "password" {
  length  = 20
  special = false
}

resource "aws_secretsmanager_secret" "master_user_secret" {
  name = "${var.cache_name}-url-secret"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "master_user_secret_version" {
  secret_id     = aws_secretsmanager_secret.master_user_secret.id
  secret_string = aws_elasticache_replication_group.cache_cluster.primary_endpoint_address

  depends_on = [
    aws_elasticache_replication_group.cache_cluster
  ]
}

resource "aws_iam_policy" "cache_secret_policy" {
  name = "${var.cache_name}-secret-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:*",
        ]
        Resource = "arn:aws:secretsmanager:*:*:secret:${var.cache_name}-url-secret-*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cache_secret_policy_attachment" {
  role       = "${var.cache_name}-service-account-role"
  policy_arn = aws_iam_policy.cache_secret_policy.arn

  depends_on = [
    aws_iam_policy.cache_secret_policy
  ]
}
