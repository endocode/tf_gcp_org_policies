# tf_gcp_org_policies
Best practice Organizational Policies for GCP

Defaults are used to indicate best practice usage. These can be overidden by passing the variable like:

```
module "org_policies" {
  source                            = "github.com/endocode/tf_gcp_org_policies"
  org_id                            = var.organization_id
  parent_folder                     = var.parent_folder
  org_disable_nested_virtualization = false
  ...
}
```

either set org_id or parent_folder -> depening where the policies should be applied.

https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints