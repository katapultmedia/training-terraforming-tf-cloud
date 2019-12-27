terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "katapultmediainc"

    workspaces {
      prefix = "tf-cloud-training-"
    }
  }
}
