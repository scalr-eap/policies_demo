package terraform

import input.tfplan as tfplan

suggested_version = "1.3.5"

# Matches that minimum version is met
suggested["Suggested version"] {
	semver.compare(tfplan.terraform_version, suggested_version) < 0

	reason := sprintf("Terraform version %s will soon be deprecated. Please migrate to version %s", [tfplan.terraform_version, suggested_version])
}
