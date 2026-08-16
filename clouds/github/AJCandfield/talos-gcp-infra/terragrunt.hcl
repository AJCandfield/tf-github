include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../..//modules/github-repository"
}

inputs = {
  name                            = "talos-gcp-infra"
  description                     = "Talos Kubernetes infrastructure on Google Cloud, managed as a portfolio project."
  visibility                      = "public"
  topics                          = ["gcp", "kubernetes", "talos", "terraform", "terragrunt", "infrastructure-as-code"]
  secret_scanning                 = true
  secret_scanning_push_protection = true
}
