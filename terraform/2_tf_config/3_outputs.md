## Output Values (outputs)

## Outputs.tf

Similar to `variables.tf`, let's now create a new file called `outputs.tf`

* `outputs.tf` will be used to define the output values from resources created/updated.

Create a `outputs.tf` file in PowerShell terminal

```powershell
cd Z:\terraform_labs
New-Item outputs.tf -Type file
code .\outputs.tf
```

Add `output` values definition such as below. Notice the use of `expressions` here to get the `id` of specified resource group.

```terraform
# outputs.tf
output "tarkett5-rg-id" {
    value = azurerm_resource_group.tarkett5-rg.id
    description = "don't show actual data on CLI output"
    sensitive = true
}

output "tarkett5-dev-rg-id" {    
    value = azurerm_resource_group.tarkett5-dev-rg.id
}
```

#### Plan and apply

```bash
terraform plan -var-file="tarkett.northeurope.tfvars"
terraform apply -auto-approve -var-file="tarkett.northeurope.tfvars"
```

#### Verify

* Observe the output on terminal.
* Notice that one of them simply shows `sensitive`. This doesn't mean it's fully secure, anyone with access to state file can still get to that data.

```bash
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

tarkett5-dev-rg-id = /subscriptions/.../resourceGroups/tarkett5-dev-rg
tarkett5-rg-id = <sensitive>
```

#### Outputs via CLI

The following commands can be used to get outputs from state and values of sensitive outputs.

```bash
# Show all outputs
terraform output
```

```bash
# Show a specific output in JSON format
terraform output -json tarkett5-rg-id
```

```bash
# Show a specific output in raw format
terraform output -raw tarkett5-rg-id
```

#### Clean up the infrastructure with `terraform destroy`

----

#### Recap:

Topics Covered: 
* https://www.terraform.io/docs/configuration/outputs.html
* https://www.terraform.io/docs/configuration/expressions.html

The terraform_labs folder should now look like below.

```
terraform_labs
|___.terraform/ 
|___tarkett.westeurope.tfvars
|___tarkett.tfplan
|___tarkett.northeurope.tfvars
|___main.tf
|___outputs.tf
|___terraform.tfstate
|___terraform.tfstate.backup
|___terraform.tfvars
|___variables.tf
----