include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/AJCandfield/tf-modules.git//modules/github/repository?ref=main"
}

inputs = {
  name        = "tf-modules"
  description = "Reusable Terraform modules organized by cloud provider, consumed by live Terragrunt repositories via git sources."
  visibility  = "public"
  topics      = ["terraform", "terragrunt", "modules", "infrastructure-as-code"]
}
