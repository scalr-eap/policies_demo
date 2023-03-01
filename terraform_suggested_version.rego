package terraform

import input.tfplan as tfplan

min_version = "1.3.5"

# Matches that minimum version is met
deny[reason] {
	semver.compare(tfplan.terraform_version, min_version) < 0

	reason := sprintf("Terraform version %s will soon be deprecated. Please migrate to version %s", [tfplan.terraform_version, min_version])
}
