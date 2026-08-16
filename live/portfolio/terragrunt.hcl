terraform {
  source = "../../modules/github-repository"
}

# State intentionally remains local until repository management grows a remote backend.
remote_state {
  backend = "local"
  config = {
    path = "${get_terragrunt_dir()}/terraform.tfstate"
  }
}

inputs = {
  name                             = "talos-gcp-infra"
  description                      = "Talos Kubernetes infrastructure on Google Cloud, managed as a portfolio project."
  visibility                       = "public"
  topics                           = ["gcp", "kubernetes", "talos", "terraform", "terragrunt", "infrastructure-as-code"]
  secret_scanning                  = true
  secret_scanning_push_protection = true
}
