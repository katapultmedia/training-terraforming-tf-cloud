![KM](https://katapultmedia.com/wp-content/uploads/2018/04/km_color_h.jpg)

# Configuring Terraform Cloud Workspaces Tutorial

Terraform Cloud (TFC) enables developers to generate workspaces dynamically through Terraform. This approach allows for a full infrastructure-as-code (ding! #buzzword) approach to your Terraform projects with repeatable patterns, customizations, and secret management (not included in this tutorial).

## Generating a TFC Workspace

A [tfe_workspace](https://www.terraform.io/docs/providers/tfe/r/workspace.html) resource can be configured as a `local` or `remote` workspace.

### Local Workspaces

A `local` workspace is intended to run on (insert your chosen CI tool here). This means your chosen CI can run the same Terraform commands it normally runs and your CI process will fit in perfectly. This is considered a "state only" configuration since the remote state is saved on TFC without any of the overhead of potentially reconfiguring your CI process.

| Commands | Where It Happens | Variables |
| --- | --- | --- |
| `plan` | CI | TBD |
| `apply` | CI | TBD |

Variables are managed however you would normally manage them through the numerous approaches available for variable management.

### Remote Workspaces

A `remote` workspace utilizes all of TFC including remote plans, manual TFC plan/apply runs, and more. TFC, in this configuration, is your Terraform CI. This is useful when TF projects are managed and versioned separately from code.

| Commands | Where It Happens | Variables |
| --- | --- | --- |
| `plan` | CI / local / TFC | TFC |
| `apply` | TFC | TFC |

Variables configured in TFC allow remote plans, either through CI, local developer runs, or as a part of an SCM webhook before merging a PR.
