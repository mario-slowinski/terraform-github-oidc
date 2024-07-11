locals {
  subjects = compact(concat(
    [for environment in var.environments : "environment:${environment}" if environment != null],
    [for branch in var.branches : "ref:refs/heads/${branch}" if branch != null],
    [for tag in var.tags : "ref:refs/tags/${tag}" if tag != null],
    [var.pull_request ? "pull_request" : null]
  ))
}
