locals {
  cloud_provider = "gitlab"
  gitlab_group   = get_env("GITLAB_GROUP", "")
  state_path     = "${get_repo_root()}/clouds/gitlab/${path_relative_to_include()}/terraform.tfstate"
}

remote_state {
  backend = "local"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    path = local.state_path
  }
}

generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "gitlab" {
  base_url = "https://gitlab.com/api/v4/"
}
EOF
}

inputs = {
  gitlab_group = local.gitlab_group
}

terraform {
  extra_arguments "lock_timeout" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=1m"]
  }

  before_hook "validate_gitlab_token" {
    commands     = ["plan", "apply"]
    execute      = ["sh", "-c", "test -n \"$GITLAB_TOKEN\" || { echo 'GITLAB_TOKEN is unset'; exit 1; }"]
    run_on_error = false
  }
}
