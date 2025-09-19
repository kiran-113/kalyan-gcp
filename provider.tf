locals {
  terraform_service_account = "terraform-sa@industrial-cat-471715-a8.iam.gserviceaccount.com"
}

provider "google" {
  project                     = var.project_id
  impersonate_service_account = local.terraform_service_account
  request_timeout             = "60s"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
}



terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.19.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }

  # Uncomment and configure the backend when you're ready to use remote state
  # backend "gcs" {
  #   bucket = "terraform-bkd-415247"
  #   prefix = "terraform/state"
  # }
}
