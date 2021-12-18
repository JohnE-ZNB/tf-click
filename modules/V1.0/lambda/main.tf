resource "aws_iam_role" "default" {
	assume_role_policy = data.aws_iam_policy_document.default.json
}

resource "aws_lambda_function" "default" {
	filename = local.lambda_zip
	function_name = var.name
	handler = var.handler
	memory_size = ceil(var.memory_mb)
	role = aws_iam_role.default.arn
	runtime = var.runtime
	source_code_hash = data.archive_file.default.output_base64sha256
	timeout = var.timeout_after_seconds

	environment {
		// * Environmental keys must not container hyphens "-" https://stackoverflow.com/a/60885479
		variables = merge([for env in var.environment: { (env["key"]) = (env["value"]) }]...)
	}
}