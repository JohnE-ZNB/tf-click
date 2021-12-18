locals {
	lambda_zip = "${var.source_directory}/terraform_${var.name}.zip"
  lambda_name = lower(var.name)
}