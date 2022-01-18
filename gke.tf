provider "google" {
  user_project_override = true
  access_token          = var.access_token
  project               = "airline1-sabre-wolverine"
}

resource "google_service_account" "default" {
  account_id   = "service-accounttf-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-tf-cluster"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 3

  private_cluster_config {
      enable_private_nodes = false
      enable_private_endpoint = false
      #master_ipv4_cidr_block = "10.0.1.0/28"
  }

  #master_authorized_networks_config {
  #  }

  ip_allocation_policy {
      cluster_ipv4_cidr_block = null
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
