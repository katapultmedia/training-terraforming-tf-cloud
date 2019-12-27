# Terraform Project


## Initializing the Workspace

Connecting your project to a TFC workspace takes a simple config like this:

```terraform
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "your-org-name-here"

    workspaces {
      prefix = "tf-cloud-training-"
    }
  }
}
```

The key part here is the use of `prefix` vs `name`. If the TFC workspaces are configured with a general prefix (think "project name"), one Terraform project can be used with multiple workspaces.

_Note: The `hostname` defaults to `app.terraform.io` so it is here just for tutorial purposes._

### `prefix` configuration

The `prefix` configuration will generate local workspaces for usage through the Terraform CLI. The initial `terraform init` run will call the TFC API, pull workspaces within the `organization`, and add them locally.

```bash
The currently selected workspace (default) does not exist.
  This is expected behavior when the selected workspace did not have an
  existing non-empty state. Please enter a number to select a workspace:

  1. local
  2. remote

  Enter a value:
```

After selecting the workspace, the local workspace will reflect the selection. All commands (`plan`, `apply`, etc) will run against the chosen workspace.

### `name` configuration

The `name` configuration uses the `default` workspace locally to target the one, specific workspace on TFC.

## Changing Workspaces

Changing a workspace is as simple as `terraform workspace select [workspace name here]`. Thinking in workspaces is a mental switch, if previous configurations consisted of a 1:1 between Terraform code and project stages (dev, qa, prod, etc).

Examples:

- `terraform workspace select dev` chooses the TFC workspace `[project name]-dev`, based on the above configuration.
- `terraform workspace select prod` chooses the TFC workspace `[project name]-prod`, based on the above configuration.

TFC allows per-project role-based access management (RBAC). The RBAC isn't super granular, but TFC does allow disabling remote `apply` runs so developers can test their TF locally before pushing commands

## Variable Management

The [cloud-config](../cloud-config) project manages all of the variables. This generates them on TFC so remote runs do not require providing the variables locally. There are caveats to this based on the project type (`local` vs `remote` runs).
