# Checks the worksoace name for a specific suffix.

package terraform

import input.tfrun as tfrun


deny["Cannot destroy this workspace"] {
    contains(tfrun.workspace.name, "scalr_controller")
}
