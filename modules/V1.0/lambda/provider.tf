terraform {
	required_version = "~> 1.0.8"

	required_providers {
		archive = {
			source = "hashicorp/archive"
			version = "~> 2.0"
		}
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.0"
		}
	}
}