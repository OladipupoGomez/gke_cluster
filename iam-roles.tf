resource "google_organization_iam_policy" "organization" {
  org_id      = GOOGLE_ORG_ID
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = GOOGLE_IAM_ROLE

    members = [
      GOOGLE_IAM_MEMBER,
    ]
  }
}