# Bootstrap and state migration

## Repository bootstrap

The public GitHub repository is managed as `AJCandfield/tf-repos`, and the local `origin` points at that URL. Confirm the remote before pushing:

```sh
gh api repos/AJCandfield/tf-repos
git remote -v
```

Export `GITHUB_TOKEN` in the shell (for example, `export GITHUB_TOKEN="$(gh auth token)"`). No token is stored in this repository. GitLab is scaffold-only and does not need `GITLAB_TOKEN` for GitHub operations.

## State migration

The GitHub leaf keeps authoritative local state beside its Terragrunt configuration at `clouds/github/AJCandfield/talos-gcp-infra/terraform.tfstate`. Verify the state before any mutation:

```sh
cd clouds/github/AJCandfield/talos-gcp-infra
terragrunt init
terragrunt state list
terragrunt plan
```

The expected address is `github_repository.this` and the expected remote object is `AJCandfield/talos-gcp-infra`. A plan must not propose recreation or destruction. Never commit state, plans, `.terraform/`, or credentials.

If a future refactor changes the resource address, use a deliberate `terraform state mv` from the old address to the new address only after reviewing both state lists. Do not apply a destructive or recreating plan.

## CI and checks

Reusable modules are initialized and validated directly. Active GitHub leaves are checked with Terragrunt parsing/formatting and a non-mutating plan when credentials are available. GitLab remains absent from CI execution because it has no live leaf and its token is not a prerequisite for GitHub validation.
