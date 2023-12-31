# LAB: How to connect to Azure Cloud Shell

### Configuring Azure Cloud Shell

Configure [Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/cloud-shell/overview) following the steps from the official Microsoft documentation.

### Connecting to Azure Cloud Shell in Windows Terminal

Azure Cloud Shell is one of the built-in profiles.

### Connecting to Azure Cloud Shell in Visual Studio Code

You need the **Azure Account** extension installed.
- Type `Ctrl+Shift+P` or F1 to open the Command Palette.
- Type `Azure: Sign in` to authenticate to Azure.

To connect to the Azure Cloud Shell, select in Terminal pane `Azure Cloud Shell (Bash)` or `Azure Cloud Shell (PowerShell)` from the list of available terminals.
Azure Cloud Shell opens as just another terminal.

### Map a file share

- Click **Upload/Download files** icon and pick **Manage file share** option.
- When the file share blade opens, click **Connect**, and then **Show script**.
- Copy the script code and run it in non-elevated PowerShell session.