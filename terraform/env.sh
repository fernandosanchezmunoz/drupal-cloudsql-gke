#!/bin/bash

##### CONFIGURE THESE ACCORDING TO YOUR SETUP ######
####################################################

#GCP account info
export ACCOUNT_ID=fersanchez@google.com					#your GCP account ID
export TF_VAR_org_id=433637338589						#your GCP org ID
export TF_VAR_billing_account=00183D-07EE2D-3060A0		#billing account for your project
#project info
export TF_VAR_project=fersanchez-2-1-2 #***PRE_CREATED*** project where the resources will be placed
export TF_VAR_region=us-east4
export TF_VAR_zone=us-east4-c
#default master password: DELETE or COMMENT for production use
export TF_VAR_master_password="12345678901234567890"

######## USUALLY NO NEED TO CONFIGURE THESE ###########
#######################################################
#Terraform version and location
export TF_VERSION="0.11.7"
export TF_FILENAME=terraform_"${TF_VERSION}"_linux_amd64.zip
export TF_URL="https://releases.hashicorp.com/terraform/"${TF_VERSION}"/"${TF_FILENAME}
export TF_BIN="terraform"
#internal
export ADMIN_SVC_ACCOUNT=$(echo tf-admin-sa-${TF_VAR_project} | cut -c1-29)"0"		#service account used by Terraform - NO SPACES
export TF_VAR_CREDS=~/.ssh/${ADMIN_SVC_ACCOUNT}.json	#location of the credentials file
declare -a SA_REQUIRED_ROLES=(\
    "roles/iam.roleAdmin" \
    "roles/iam.serviceAccountAdmin" \
    "roles/iam.serviceAccountActor" \
    "roles/iam.serviceAccountKeyAdmin" \
    "roles/resourcemanager.projectIamAdmin" \
    "roles/compute.storageAdmin" \
    "roles/storage.admin" \
    "roles/storage.objectAdmin" \
    "roles/compute.securityAdmin" \
    "roles/compute.networkAdmin" \
    "roles/compute.instanceAdmin.v1" \
    "roles/cloudsql.admin" \
    "roles/container.admin" \
    "roles/dns.admin" \
    )
declare -a REQUIRED_APIS=(\
    "container.googleapis.com" \
    "compute.googleapis.com" \
    "dns.googleapis.com" \
    'iam.googleapis.com' \
    'replicapool.googleapis.com' \
    'replicapoolupdater.googleapis.com' \
    'resourceviews.googleapis.com' \
    'sql-component.googleapis.com' \
    'sqladmin.googleapis.com' \
    'storage-api.googleapis.com' \
    'storage-component.googleapis.com' \
    'cloudresourcemanager.googleapis.com' \
    )
export TF_VAR_bucket_name=${TF_VAR_project}"-terraform"
export GOOGLE_APPLICATION_CREDENTIALS=${TF_VAR_CREDS}
export GOOGLE_PROJECT=${TF_VAR_project}
#network and security
export TF_VAR_network=${TF_VAR_project}"-net"			#name of a network to be created
export TF_VAR_subnetwork=${TF_VAR_project}"-subnet"		#name of a subnet to be created
export TF_VAR_subnetcidr="10.10.10.0/24"				#addressing for the subnet
export TF_VAR_tag=${TF_VAR_project}"-tag"               #used to group instances for firewalling
#Storage - Shared filesystem
export TF_VAR_fs_name="bitnami-fs"
export TF_VAR_fs_size="200Gi"
export TF_VAR_fs_mount_path="/bitnami"
#service account to use for CloudSQL proxy
export TF_VAR_cloudsql_service_account_name="cloudsql-svc-acct"
export TF_VAR_cloudsql_service_account_description="Service account for CloudSQL proxy"
export TF_VAR_cloudsql_client_role="roles/cloudsql.client"
export TF_VAR_create_keys_role="roles/iam.serviceAccountKeyAdmin"
#cloudSQL
export TF_VAR_cloudsql_instance=$TF_VAR_project"-sql"
export TF_VAR_cloudsql_username="cloudsqlproxy"
export TF_VAR_cloudsql_tier="db-n1-standard-1"
export TF_VAR_cloudsql_storage_type="SSD"
export TF_VAR_cloudsql_db_version="MYSQL_5_7"
export TF_VAR_cloudsql_db_creds_path="~/.ssh/cloudsql-tf-creds.json"
#GKE cluster details
export TF_VAR_gke_cluster_name=$TF_VAR_project"-gke"
export TF_VAR_gke_cluster_version="1.8.8-gke.0"
export TF_VAR_gke_machine_type="n1-standard-2"
export TF_VAR_gke_cluster_size="3"
export TF_VAR_gke_max_cluster_size="10"
export TF_VAR_gke_username="client"
#GKE service
export TF_VAR_gke_service_name=$TF_VAR_project"-drupal-svc"
export TF_VAR_gke_app_name=$TF_VAR_project"-drupal-app"
export TF_VAR_gke_drupal_image="bitnami/drupal:8.3.7-r0"
export TF_VAR_drupal_username="user"
export TF_VAR_drupal_email="user@example.com"
export TF_VAR_drupal_password=$TF_VAR_master_password
export TF_VAR_gke_cloudsql_image="gcr.io/cloudsql-docker/gce-proxy:1.09"
#networking
export TF_VAR_ext_ip_name=$TF_VAR_project"-ext-ip"
export TF_VAR_domain="groundcontrol.me"
export TF_VAR_dns_zone_name="blog"
export TF_VAR_dns_name=$TF_VAR_dns_zone_name"."$TF_VAR_domain
