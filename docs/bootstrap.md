# Bootstrap and state migration

## Rename and repository bootstrap

The public GitHub repository was renamed out-of-band from `AJCandfield/tf-github` to `AJCandfield/tf-repo-management`; the local `origin` points at the renamed URL. Confirm the remote before pushing:

```sh
gh api repos/AJCandfield/tf-repo-management
git remote -v
```

Export `GITHUB_TOKEN` in the shell (for example, `export GITHUB_TOKEN="$(gh auth token)"`). No token is stored in this repository. GitLab is scaffold-only and does not need `GITLAB_TOKEN` for GitHub operations.

## State migration

The former local state was backed up outside Git at `/Users/aj/code/state-backups/tf-github-portfolio-20260816181114.tfstate` and moved to `clouds/github/AJCandfield/talos-gcp-infra/terraform.tfstate`. Verify the state before any mutation:

```sh
cd clouds/github/AJCandfield/talos-gcp-infra
terragrunt init
terragrunt state list
terragrunt plan
```

The expected address is `github_repository.this` and the expected remote object is `AJCandfield/talos-gcp-infra`. A plan must not propose recreation or destruction. Stop and restore the backup if that occurs. Never commit state, plans, `.terraform/`, or credentials.

If a future refactor changes the resource address, use a deliberate `terraform state mv` from the old address to the new address only after reviewing both state lists. Do not apply a destructive or recreating plan.

## CI and checks

Reusable modules are initialized and validated directly. Active GitHub leaves are checked with Terragrunt parsing/formatting and a non-mutating plan when credentials are available. GitLab remains absent from CI execution because it has no live leaf and its token is not a prerequisite for GitHub validation.
