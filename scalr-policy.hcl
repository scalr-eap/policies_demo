version = "v1"

policy "limit_modules" {
    enabled = true
    enforcement_level = "advisory"
}

policy "workspace_name_convention" {
    enabled = true
    enforcement_level = "advisory"
}

policy "limit_instance_types" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "limit_cost" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "limit_network" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "protect_controller" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "approver" {
   enabled = false
   enforcement_level = "soft-mandatory"
}

policy "deny_auto_approval" {
   enabled = false
   enforcement_level = "soft-mandatory"
}
