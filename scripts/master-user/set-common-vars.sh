export TERRAGRUNT_WORKING_DIR="$GITHUB_WORKSPACE/deploy/master-user"
export TF_INPUT=false

mkdir -p "$GITHUB_WORKSPACE/out"

PLAN_PATH="$GITHUB_WORKSPACE/out/master-user.tfplan"