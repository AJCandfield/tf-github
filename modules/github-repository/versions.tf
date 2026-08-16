terraform {
  required_version = ">= 1.15.8"

  backend "local" {}

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.0, < 7.0"
    }
  }
}
