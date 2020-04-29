version = "v1"

policy "cost-check" {
    enabled = true
    enforcement_level = "soft-mandatory"
}

policy "workspace-name" {
    enabled = true
    enforcement_level = "advisory"
}

policy "instance_types" {
    enabled = true
    enforcement_level = "hard-mandatory"
}
