version = "v1"

#policy "terraform_version_check" {
#    enabled = true
#    enforcement_level = "soft-mandatory"
#}

policy "terraform_min_version" {
  enabled = true
  enforcement_level = "hard-mandatory"
}


policy "terraform_suggested_version" {
  enabled = true
  enforcement_level = "soft-mandatory"
}

policy "limit_modules" {
    enabled = false
    enforcement_level = "soft-mandatory"
}

policy "workspace_name_convention" {
    enabled = true
    enforcement_level = "advisory"
}

policy "limit_cost" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "protect_controller" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "destroy_approval" {
    enabled = true
    enforcement_level = "soft-mandatory"
}
