# tf-github

Reusable Terraform/Terragrunt management for public GitHub repositories in the `AJCandfield` account.

## Bootstrap

This repository is intentionally bootstrapped once out-of-band: Terraform cannot create the repository containing its own configuration. Authenticate with `gh auth login`, then export a short-lived token only in the shell when running Terraform:

```sh
export GITHUB_TOKEN="$(gh auth token)"
cd live/portfolio
tg init
tg plan       # review the talos-gcp-infra repository change
tg apply      # approved GitHub-only mutation; never targets GCP
```

Do not write tokens to files or commit local state. State is local and gitignored.

## Layout

- `modules/github-repository`: reusable repository resource and policy inputs.
- `live/portfolio`: Terragrunt-managed repository declarations and local state.

## Checks

```sh
terraform fmt -check -recursive
pre-commit run --all-files
```

CI performs formatting, validation, lint, documentation, and pre-commit checks only; it never applies infrastructure.
