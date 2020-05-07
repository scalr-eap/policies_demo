package terraform 

import input.tfplan as tfplan
import input.tfrun as tfrun

##In this example, the user can only provision to a single subnet. Update the list accordingly##
allowed_network = "subnet-0ebb1058ad727cfdb"

deny[reason] {
 subnet = tfplan.resource_changes.change.after.subnet_id
 subnet != allowed_network
}
