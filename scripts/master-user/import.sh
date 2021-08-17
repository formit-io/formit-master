#!/bin/bash -e

. "$GITHUB_WORKSPACE/scripts/master-user/set-common-vars.sh"

terragrunt import aws_iam_user.master formit-master
terragrunt import aws_iam_user_policy_attachment.admin formit-master/arn:aws:iam::aws:policy/AdministratorAccess
terragrunt import aws_iam_access_key.master AKIAVV7Y44XWNW275LFW
