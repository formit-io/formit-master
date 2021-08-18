#!/bin/bash -e

. "$GITHUB_WORKSPACE/scripts/master-user/set-common-vars.sh"

terragrunt state rm aws_iam_access_key.master