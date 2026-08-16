resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  topics      = sort(tolist(var.topics))

  has_issues   = var.has_issues
  has_projects = var.has_projects
  has_wiki     = var.has_wiki

  allow_squash_merge     = var.allow_squash_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = false

  security_and_analysis {
    secret_scanning {
      status = var.secret_scanning ? "enabled" : "disabled"
    }
    secret_scanning_push_protection {
      status = var.secret_scanning_push_protection ? "enabled" : "disabled"
    }
  }
}
