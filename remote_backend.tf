terraform {
  backend "remote" {
    organization = "security-framework"

    workspaces {
      name = "security-test-workspace"
    }
  }
}