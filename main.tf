provider "google" {
  version = "~> 1.0"                                                                                                         
}

resource "google_storage_bucket" "state_bucket" {
  name     = "${var.bucket_name}"
  location = "us-west1"

  versioning {
    enabled = true
  }

  labels {
    name = "state-bucket"
  }
}

resource "google_storage_bucket_acl" "state_bucket_acl" {
  bucket = "${google_storage_bucket.state_bucket.name}"
  predefined_acl = "private"
}
