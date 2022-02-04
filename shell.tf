provider "google" {
  
}

resource "null_resource" "sample_check" {

 provisioner "local-exec" {
    
    command = "bash sample.sh ${var.location} ${var.sa_name}" 
  }
  /*
  depends_on = [
    google_service_account.default,
    google_container_cluster.primary,
    google_container_node_pool.primary_preemptible_nodes
  ]*/
}
