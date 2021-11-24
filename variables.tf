variable "org_id" {
  description = "Orgnaization ID the policies should be applied on"
  type        = string
}

variable "parent_folder" {
  description = "Base folder ID the policies should be applied on"
  type        = string
}

variable "allowed_regions" {
  description = "allowed regions"
  type        = list(string)
}

variable "domains_to_allow" {
  description = "Domains we allow to share with"
  type        = list(string)
}