package terraform 

import input.tfplan as tfplan
import input.tfrun as tfrun

##In this example, the user can only provision to a single subnet. Update the list accordingly##
allowed_network = "subnet-0ebb1058ad727cfdb"

deny["Network not allowed!"] {
    r = tfplan.resource_changes[_]
    r.change.after.subnet_id != allowed_network
}
