resource "aws_ecr_repository" "opsledger_web" {
  name                 = var.ecrRepositoryName
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Project = "OpsLedger"
  }
}
