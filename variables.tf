variable "base_folder" {
  description = "Base folder ID the policies should be applied on"
  type        = string
}

variable "allowed_regions" {
  description = "allowed regions"
  type        = list(string)
}