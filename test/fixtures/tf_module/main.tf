provider "google" {
  credentials = "${file("${var.google_application_credentials}")}"
  project     = "${var.gcloud_project}"
  region      = "${var.gcloud_region}"
  version     = "~> 1.0"
}

module "bucket" {
  source = "../../.."

  bucket_name = "test-org-state-bucket"
}
