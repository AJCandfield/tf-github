terraform {
  required_version = ">= 1.15.8"

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 18.0, < 19.0"
    }
  }
}
