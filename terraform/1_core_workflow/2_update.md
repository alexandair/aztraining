#### Understand the terraform core workflow. (write, plan, apply)

## Terraform Core Workflow

* Write
* Plan 
* Apply

## Operation: Update

**Write**

Open `main.tf` in the editor and add a `tag` by making the below change within `tarkett5-rg` resource
Go to PowerShell terminal.

```powershell
cd Z:\terraform_labs
code .\main.tf
```

```terraform
tags = {
    "cost_center" = "tarkett research"
}
```
It should look something like below

``` terraform
resource "azurerm_resource_group" "tarkett5-rg" {
    name = "tarkett5-rg"
    location = "northeurope"

    tags = {
        "cost_center" = "tarkett research"
    } 
}
```

* Save `main.tf` 

> Note: we are not doing an `init` this time because the `.terraform` folder and `azure provider` plugin is already available from our previous run. When running in a `CI / CD` pipeline, this step may be required.

**Plan**

Do a `terraform plan` but this time we are also storing the **`output`** in a separate `.tfplan` file

```bash
terraform plan -out tarkett.tfplan
```  

Take a look at the plan file that's been created using **`show`** command as before.

```bash
terraform show tarkett.tfplan
```   
You should see something like below

```
An execution plan has been generated and is shown below.
Terraform will perform the following actions:

  # azurerm_resource_group.tarkett5-rg will be updated in-place
  ~ resource "azurerm_resource_group" "tarkett5-rg" {
        id ="...."
        ....other properties..
      ~ tags     = {
          + "cost_center = "tarkett research"
        }
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

**Apply**

Pass the plan file to `terraform apply`` and this time, we also do an `-auto-approve`, so we are not prompted for approval.

```bash
# Note: ordering of args is important in this case.
terraform apply -auto-approve "tarkett.tfplan"
```

The terminal output should state something like below

```bash
Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

**Verify**

Verify that `cost_center` tag has been created on our resource group.

```bash
# You can use the portal or run the below Azure CLI command
az group show --name "tarkett5-rg"
```

Take a quick look at the state file as well.

```bash
terraform show terraform.tfstate
```
---