variable "access_token" {
  description = "access_token"
  type        = string
  sensitive   = true
}
variable "cluster_name" {
  description = "cluster_name"
  type        = string
}
variable "cluster_pool" {
  description = "cluster_pool"
  type        = string
}
variable "sa_name" {
  description = "sa_name"
  type        = string
}
variable "location" {
  description = "location"
  type        = string
}
variable "project" {
  description = "project"
  type        = string
}
variable "release_name" {
  description = "release_name"
  type        = string
}
variable "helm_path" {
  description = "helm_path"
  type        = string
}
