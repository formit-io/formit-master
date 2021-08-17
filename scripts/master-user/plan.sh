#!/bin/bash -e

. "$GITHUB_WORKSPACE/scripts/master-user/set-common-vars.sh"

terragrunt plan -out "$PLAN_PATH"