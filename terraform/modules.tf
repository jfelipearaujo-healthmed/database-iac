module "user_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "user"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  vpc_name = var.vpc_name
}

module "schedule_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "schedule"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  vpc_name = var.vpc_name
}

module "appointment_db" {
  source = "./modules/database_sql"

  region = var.region

  db_name           = "appointment"
  db_engine         = "postgres"
  db_engine_version = "16"
  db_instance_class = "db.t3.micro"
  db_port           = 5432
  db_username       = "healthmed"

  vpc_name = var.vpc_name
}
