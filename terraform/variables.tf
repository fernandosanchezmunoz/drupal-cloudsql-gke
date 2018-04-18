//variables

//master password is undefined for cloudsql and gke

variable "master_password" {}

//project, admin

variable "project" {}
variable "region" {}
variable "zone" {}
variable "num_instances" {}
variable "name" {}

//network,security

variable "network" {}
variable "tag" {}

variable "ports" {
  description = "Ports the HTTP server listens on"
  type        = "list"
  default     = [8080, 8081]
}

//NFS

variable "nfs_export_path" {}
variable "nfs_snapshot" {}
variable "nfs_disk" {}
variable "nfs_vol_1" {}
variable "nfs_vol_2" {}
variable "nfs_device_name" {}

//cloudsql service account

variable "cloudsql_service_account_name" {}
variable "cloudsql_service_account_role" {}

//cloudSQL

variable "cloudsql_instance" {}
variable "cloudsql_username" {}
variable "cloudsql_tier" {}
variable "cloudsql_storage_type" {}
variable "cloudsql_db_version" {}

//GKE

variable "gke_cluster_name" {}
variable "gke_cluster_version" {}
variable "gke_machine_type" {}
variable "gke_cluster_size" {}
variable "gke_username" {}

//data
data "google_compute_zones" "available" {}