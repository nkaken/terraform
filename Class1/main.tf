resource "aws_iam_user" "user" {
  name = "kaizen"
}
resource "aws_iam_group" "group" {
  name = "engineers"
}