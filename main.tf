provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_iam_user" "nopporn" {
  name = "nopporn"

  tags = {
    full-name = "Nopporn Chumnininini"
  }
}

resource "aws_iam_user_policy" "self-service" {
  policy = data.aws_iam_policy_document.self-service-doc.json
  user = "nopporn"
  name = "SelfService"
}

data "aws_iam_policy_document" "self-service-doc" {
  statement {
    sid       = "AllowIndividualUserToSeeAndManageOnlyTheirOwnAccountInformation"
    effect    = "Allow"
    resources = ["arn:aws:iam::*:user/$${aws:username}"]

    actions = [
      "iam:ChangePassword",
      "iam:CreateAccessKey",
      "iam:CreateLoginProfile",
      "iam:DeleteAccessKey",
      "iam:DeleteLoginProfile",
      "iam:GetLoginProfile",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
      "iam:UpdateLoginProfile",
    ]
  }
}