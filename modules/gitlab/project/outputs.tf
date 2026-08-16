output "id" {
  description = "GitLab project ID."
  value       = gitlab_project.this.id
}

output "web_url" {
  description = "GitLab project URL."
  value       = gitlab_project.this.web_url
}
