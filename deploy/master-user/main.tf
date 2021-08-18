resource "aws_iam_user" "master" {
  name = var.component_name
  path = "/"
}

data "aws_iam_policy" "admin" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "admin" {
  user       = aws_iam_user.master.name
  policy_arn = data.aws_iam_policy.admin.arn
}

resource "aws_iam_policy" "permissions" {
  name   = var.component_name
  path   = "/"
  policy = data.aws_iam_policy_document.permissions.json
}

resource "aws_iam_user_policy_attachment" "permissions" {
  user       = aws_iam_user.master.name
  policy_arn = aws_iam_policy.permissions.arn
}

data "aws_iam_policy_document" "permissions" {
  version = "2012-10-17"
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    resources = [
      "arn:aws:iam::*:role/OrganizationAccountAccessRole",
    ]
  }
  statement {
    actions = [
      "s3:*",
    ]
    resources = [
      "arn:aws:s3:::formit-*terraform-state*",
      "arn:aws:s3:::formit-*terraform-state*/*"
    ]
  }
}

resource "aws_iam_access_key" "master" {
  user    = var.component_name
}