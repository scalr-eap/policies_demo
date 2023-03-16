# Will deny the run if it contains destructive actions

package terraform

import input.tfplan as tfplan
import input.tfrun as tfrun


deny[reason] {
    resource := tfplan.resource_changes[_]
    # if you require scalr status check to be passed on PR, that will help you to pass soft-mandatory policy
    # but in apply run it will deny runs with destructive changes
    tfrun.is_dry == false
    contains(resource.change.actions, "delete")
    reason := sprintf("resource deletion is forbidden: '%s'", [resource.address])
}

contains(changes, elem) {
  changes[_] = elem
}
