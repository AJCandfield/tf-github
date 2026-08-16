terraform {
  required_version = ">= 1.15.8"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.0, < 7.0"
    }
  }
}

provider "github" {
  owner = "AJCandfield"
}
