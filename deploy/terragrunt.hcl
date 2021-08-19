locals {
  repository_name = get_env("GITHUB_REPOSITORY")
  project_name = "formit-master"
  component_name = "formit-master"
  config = yamldecode(file(find_in_parent_folders("deploy-config.yml")))[get_env("ENVIRONMENT_NAME")]
  tags = {
    "environment:name" = local.config.environment_name
    "repo:name"        = local.repository_name
  }
}

inputs = {
  component_name = local.component_name
  environment_name = local.config.environment_name
  common_tags = local.tags
}

remote_state {
  backend = "s3"
  disable_init = tobool(get_env("TERRAGRUNT_DISABLE_INIT", "false"))

  config = {
    bucket              = "${local.project_name}-terraform-state"
    key                 = "${local.config.account_id}/${local.config.environment_name}/${path_relative_to_include()}/${get_env("AWS_DEFAULT_REGION")}/terraform.tfstate"
    region              = "eu-west-1"
    encrypt             = true
    dynamodb_table      = "${local.project_name}-terraform-state-lock"
    s3_bucket_tags      = local.tags
    dynamodb_table_tags = local.tags
  }
}