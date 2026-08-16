variable "name" {
  description = "GitLab project display name."
  type        = string
}

variable "path" {
  description = "GitLab project URL path."
  type        = string
  default     = null
}

variable "namespace_id" {
  description = "GitLab namespace ID. Required when this module is used."
  type        = number
  default     = null
}

variable "description" {
  type    = string
  default = null
}

variable "visibility_level" {
  type    = string
  default = "public"

  validation {
    condition     = contains(["private", "internal", "public"], var.visibility_level)
    error_message = "Visibility must be private, internal, or public."
  }
}

variable "topics" {
  type    = set(string)
  default = []
}

variable "issues_enabled" {
  type    = bool
  default = true
}

variable "merge_requests_enabled" {
  type    = bool
  default = true
}

variable "wiki_enabled" {
  type    = bool
  default = false
}
