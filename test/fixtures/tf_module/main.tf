terraform {
  required_version = ">= 0.10.2, < 0.12"
}

provider "google" {
  credentials = "${file("${var.google_application_credentials}")}"
  project     = "${var.gcloud_project}"
  region      = "${var.gcloud_region}"
  version     = "~> 1.0"
}

provider "random" {
  version = "~> 1.0"
}

resource "random_pet" "name" {
  length = "1"
}

module "bucket" {
  source = "../../.."

  bucket_name = "${random_pet.name.id}"
}
