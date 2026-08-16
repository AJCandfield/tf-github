output "name" {
  description = "Repository name."
  value       = github_repository.this.name
}

output "html_url" {
  description = "Repository URL."
  value       = github_repository.this.html_url
}

output "full_name" {
  description = "Repository owner and name."
  value       = github_repository.this.full_name
}
