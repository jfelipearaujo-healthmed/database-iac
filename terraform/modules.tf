module "users_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "users"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  services = [
    "users",
  ]

  vpc_name = var.vpc_name
}

module "scheduler_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "scheduler"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  services = [
    "scheduler",
  ]

  vpc_name = var.vpc_name
}

module "appointments_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "appointments"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  services = [
    "review-processor",
    "appointments",
    "appointment-creator",
  ]

  vpc_name = var.vpc_name
}

module "cache" {
  source = "./modules/cache"

  cache_node_type      = "cache.t3.micro"
  cache_engine         = "redis"
  cache_engine_version = "6.2"
  cache_name           = "healthmed-cache"
  cache_port           = 6379

  services = [
    "users",
    "scheduler",
  ]

  vpc_name = var.vpc_name
}
