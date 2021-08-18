provider "aws" {
  default_tags {
    tags = var.common_tags
  }
}

provider "github" {
  owner = "formit-io"
}