variable "org_id" {
  description = "Orgnaization ID the policies should be applied on"
  type        = string
}

variable "parent_folder" {
  description = "Base folder ID the policies should be applied on"
  type        = string
}

variable "org_disable_nested_virtualization" {
  type    = bool
  default = true
}

variable "org_disable_serial_port_access" {
  type    = bool
  default = true
}

variable "org_compute_disable_guest_attributes_access" {
  type    = bool
  default = true
}

variable "org_vm_external_ip_access" {
  type    = bool
  default = true
}

variable "org_skip_default_network" {
  type    = bool
  default = true
}

variable "org_shared_vpc_lien_removal" {
  type    = bool
  default = true
}

variable "org_shared_require_os_login" {
  type    = bool
  default = false
}

variable "org_shared_resource_locations" {
  type    = bool
  default = false
}

variable "allowed_regions" {
  type    = list(string)
  default = [""]
}

variable "org_cloudsql_external_ip_access" {
  type    = bool
  default = true
}

variable "org_domain_restricted_sharing" {
  type    = bool
  default = false
}

variable "domains_to_allow" {
  type    = list(string)
  default = [""]
}

variable "org_disable_sa_key_creation" {
  type    = bool
  default = false
}

variable "org_disable_automatic_iam_grants_on_default_service_accounts" {
  type    = bool
  default = false
}

variable "org_enforce_bucket_level_access" {
  type    = bool
  default = false
}

variable "create_access_context_manager_access_policy" {
  type    = bool
  default = false
}
