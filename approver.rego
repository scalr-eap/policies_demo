# Commit author email and run creation email cannot be the same person

package terraform

import input.tfrun as tfrun

array_contains(arr, elem) {
	arr[_] == elem
}

# Check if value is in white list for the attribute
deny[reason] {
	tfrun.source == "vcs"
  tfrun.workspace.auto_apply == true
  tfrun.is_dry == false
  #tfrun.vcs.commit.author.email = tfrun.created_by.email
  
  not array_contains(tfrun.vcs.commit.author.email, tfrun.created_by.email)

	reason := sprintf("%s.%s :: user %s is not allowed to auto-apply runs.", 
	                    [tfrun.environment.name, tfrun.workspace.name, tfrun.created_by.email])
}
