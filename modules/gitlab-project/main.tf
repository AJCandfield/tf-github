resource "gitlab_project" "this" {
  name             = var.name
  path             = var.path
  namespace_id     = var.namespace_id
  description      = var.description
  visibility_level = var.visibility_level
  topics           = sort(tolist(var.topics))

  issues_enabled         = var.issues_enabled
  merge_requests_enabled = var.merge_requests_enabled
  wiki_enabled           = var.wiki_enabled
  initialize_with_readme = false
}
