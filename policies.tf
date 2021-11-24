module "sql-restrict-public-ip" {
  source      = "terraform-google-modules/org-policy/google"
  policy_for  = "folder"
  folder_id   = var.base_folder
  constraint  = "constraints/sql.restrictPublicIp"
  policy_type = "boolean"
  enforce     = true
}

module "resource-locations" {
  source            = "terraform-google-modules/org-policy/google"
  policy_for        = "folder"
  folder_id         = var.base_folder
  constraint        = "constraints/gcp.resourceLocations"
  policy_type       = "list"
  enforce           = null
  allow             = var.allowed_regions
  allow_list_length = 1
}

module "compute-vm-external-ip-access" {
  source      = "terraform-google-modules/org-policy/google"
  policy_for  = "folder"
  folder_id   = var.base_folder
  constraint  = "constraints/compute.vmExternalIpAccess"
  policy_type = "list"
  enforce     = true
}
