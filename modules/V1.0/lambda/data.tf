data "archive_file" "default" {
	excludes = concat(["terraform_${var.name}.zip"], var.excluded_files)
	output_path = local.lambda_zip
	source_dir = var.source_directory
	type = "zip"
}
data "aws_iam_policy_document" "default" {
	version = "2012-10-17"

	statement {
		actions = ["sts:AssumeRole"]
		effect = "Allow"

		principals {
			identifiers = ["lambda.amazonaws.com"]
			type = "Service"
		}
	}
}