# tf-repo-management

Backend-neutral Terraform/Terragrunt management for AJCandfield's public source repositories.

## Intent and scope

This repository manages repository lifecycle policy as infrastructure. GitHub is the active backend and currently manages `AJCandfield/talos-gcp-infra`. GitLab support is scaffolded for later use and intentionally has no live project declaration.

This project does not create cloud infrastructure, Kubernetes clusters, GitLab projects, or Linear issues. State remains local and ignored during this bootstrap.

## Architecture and status

- `modules/github-repository/` contains the reusable GitHub repository module.
- `modules/gitlab-project/` contains a reusable GitLab project module for future use.
- `clouds/github/` and `clouds/gitlab/` are separate Terragrunt roots with independent providers and state prefixes.
- The GitHub leaf adopts the existing repository state under its backend-specific path.

Status: GitHub active; GitLab scaffold-only; local-state migration and bootstrap validation are documented in `docs/`.
