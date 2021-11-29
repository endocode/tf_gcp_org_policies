
locals {
  organization_id = var.parent_folder != "" ? null : var.org_id
  folder_id       = var.parent_folder != "" ? var.parent_folder : null
  policy_for      = var.parent_folder != "" ? "folder" : "organization"
}


/******************************************
  Compute org policies
*******************************************/

module "org_disable_nested_virtualization" {
  count           = var.org_disable_nested_virtualization ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableNestedVirtualization"
}

module "org_disable_serial_port_access" {
  count           = var.org_disable_serial_port_access ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableSerialPortAccess"
}

module "org_compute_disable_guest_attributes_access" {
  count           = var.org_compute_disable_guest_attributes_access ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.disableGuestAttributesAccess"
}

module "org_vm_external_ip_access" {
  count           = var.org_vm_external_ip_access ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "list"
  enforce         = "true"
  constraint      = "constraints/compute.vmExternalIpAccess"
}

module "org_skip_default_network" {
  count           = var.org_skip_default_network ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.skipDefaultNetworkCreation"
}

module "org_shared_vpc_lien_removal" {
  count           = var.org_shared_vpc_lien_removal ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.restrictXpnProjectLienRemoval"
}

module "org_shared_require_os_login" {
  count           = var.org_shared_require_os_login ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/compute.requireOsLogin"
}

module "org_shared_resource_locations" {
  count             = var.org_shared_resource_locations ? 1 : 0
  source            = "terraform-google-modules/org-policy/google"
  policy_for        = "folder"
  folder_id         = local.folder_id
  constraint        = "constraints/gcp.resourceLocations"
  policy_type       = "list"
  enforce           = null
  allow             = var.allowed_regions
  allow_list_length = 1
}

/******************************************
  Cloud SQL
*******************************************/

module "org_cloudsql_external_ip_access" {
  count           = var.org_cloudsql_external_ip_access ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/sql.restrictPublicIp"
}

/******************************************
  IAM
*******************************************/

module "org_domain_restricted_sharing" {
  count            = var.org_domain_restricted_sharing ? 1 : 0
  source           = "terraform-google-modules/org-policy/google//modules/domain_restricted_sharing"
  version          = "~> 5.0"
  organization_id  = local.organization_id
  folder_id        = local.folder_id
  policy_for       = local.policy_for
  domains_to_allow = var.domains_to_allow
}

module "org_disable_sa_key_creation" {
  count           = var.org_disable_sa_key_creation ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/iam.disableServiceAccountKeyCreation"
}

module "org_disable_automatic_iam_grants_on_default_service_accounts" {
  count           = var.org_disable_automatic_iam_grants_on_default_service_accounts ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
}

/******************************************
  Storage
*******************************************/

module "org_enforce_bucket_level_access" {
  count           = var.org_enforce_bucket_level_access ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 5.0"
  organization_id = local.organization_id
  folder_id       = local.folder_id
  policy_for      = local.policy_for
  policy_type     = "boolean"
  enforce         = "true"
  constraint      = "constraints/storage.uniformBucketLevelAccess"
}

/******************************************
  Access Context Manager Policy
*******************************************/

resource "google_access_context_manager_access_policy" "access_policy" {
  count  = var.create_access_context_manager_access_policy ? 1 : 0
  parent = "organizations/${var.org_id}"
  title  = "default policy"
}