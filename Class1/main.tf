resource "aws_iam_user" "lb" {
  name = "nkaken" 
}

resource "aws_iam_user" "lb_one" {
  name = "nkaken_one" 
}

resource "aws_iam_user" "lb_two" {
  name = "nkaken_two" 
}

resource "aws_iam_user" "lb1" {
  name = "aws-cli" 
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb_one.name,
    aws_iam_user.lb_two.name,
  ]

  group = aws_iam_group.group.name
}