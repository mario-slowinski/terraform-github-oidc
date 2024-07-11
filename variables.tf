variable "application_name" {
  type        = string
  description = "Name of application and service principal. Use var.github_repository if not set."
  default     = null
}

variable "github_repository" {
  type        = string
  description = "(Required) Name of the repository in the form (org | user)/repository"

  validation {
    condition     = can(regex("[a-zA-Z][a-zA-Z0-9-]*/[a-zA-Z0-9][a-zA-Z0-9_\\-\\.]*", var.github_repository))
    error_message = "Repository name must be in the form organization/repository or username/repository."
  }
}

variable "environments" {
  type        = list(string)
  description = "(Optional) Name of environment entity."
  default     = [null]
}

variable "branches" {
  type        = list(string)
  description = "Name of branch to use with ref entity. Set to 'master' by default."
  default     = [null]
}

variable "tags" {
  type        = list(string)
  description = "(Optional) Name of tag to use with ref entity."
  default     = [null]
}

variable "pull_request" {
  type        = bool
  description = "Whether to include pull request in subjects?"
  default     = false
}

variable "owner_id" {
  type        = string
  description = "(Optional) Object ID of owner to be assigned to service principal. Assigned to current user if not set."
  default     = null
}
