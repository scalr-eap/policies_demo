#This policy will forbid resources from getting created unless done so through a module, specifically RDS in this.
package terraform

import input.tfplan as tfplan


# Map of resource types which must be created only using module
# with corresponding module source
resource_modules = {
    "aws_db_instance": "terraform-aws-modules/rds/aws",
    "aws_s3_bucket": "scalr-demo.scalr.io/acc-sscctbisjkl35b8/s3-bucket/aws"
}

contains(arr, elem) {
  arr[_] = elem
}

deny[reason] {
    resource := tfplan.resource_changes[_]
    action := resource.change.actions[count(resource.change.actions) - 1]
    contains(["create", "update"], action)
    module_source = resource_modules[resource.type]
    not resource.module_address
    reason := sprintf(
        "%s cannot be created directly. Module '%s' must be used instead",
        [resource.address, module_source]
    )
}

deny[reason] {
    resource := tfplan.resource_changes[_]
    action := resource.change.actions[count(resource.change.actions) - 1]
    contains(["create", "update"], action)
    module_source = resource_modules[resource.type]
    parts = split(resource.module_address, ".")
    module_name := parts[1]
    actual_source := tfplan.configuration.root_module.module_calls[module_name].source
    not actual_source == module_source
    reason := sprintf(
        "%s must be created with '%s' module, but '%s' is used",
        [resource.address, module_source, actual_source]
    )
}
