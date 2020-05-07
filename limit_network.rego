package terraform 

import input.tfplan as tfplan
import input.tfrun as tfrun

##In this example, the user can only provision to a single subnet. Update the list accordingly##
allowed_network = "subnet-0ebb1058ad727cfdb"

deny["Only subnet-0ebb1058ad727cfdb allowed!"] {
    r = tfplan.resource_changes.after[_]
    r.subnet_id != allowed_resource
}
