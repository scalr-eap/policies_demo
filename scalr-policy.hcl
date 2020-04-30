version = "v1"

policy "limit_modules" {
    enabled = true
    enforcement_level = "hard-mandatory"
}

policy "workspace_name_convention" {
    enabled = true
    enforcement_level = "advisory"
}

policy "limit_instance_types" {
    enabled = true
    enforcement_level = "soft-mandatory"
}