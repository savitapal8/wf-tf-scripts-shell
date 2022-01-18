resource "null_resource" "sample_check" {

 provisioner "local-exec" {
    
    command = "/bin/bash sample.sh"
  }
  depends_on = [
    google_service_account.default,
    google_container_cluster.primary,
    google_container_node_pool.primary_preemptible_nodes
  ]
}
