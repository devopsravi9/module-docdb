resource "aws_docdb_cluster" "main" {
  cluster_identifier      = local.TAG_PREFIX
  engine                  = var.DOCDB_ENGINE
  engine_version          = var.DOCDB_ENGINE_VERSION
  master_username         = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_USER"]
  master_password         = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["DOCDB_PASS"]
  skip_final_snapshot     = true
  vpc_security_group_ids = [aws_security_group.main.id]
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.main.name
  db_subnet_group_name = aws_docdb_subnet_group.main.name
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = var.DOCDB_INSTANCE_COUNT
  identifier         = local.TAG_PREFIX
  cluster_identifier = aws_docdb_cluster.main.id
  instance_class     = var.DOCDB_INSTANCE_CLASS
}

