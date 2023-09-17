# LAB: Configure Azure PowerShell and Azure CLI

### Configure Azure PowerShell

To enable **Az Predictor** for all sessions, run the following command and it will update your PowerShell profile (`$profile`).
If you want this enabled in Windows Terminal and VSCode's terminal, you need to run it in both terminals, because the PowerShell profile is different for each terminal (host).

```powershell
Enable-AzPredictor -AllSession

code $PROFILE
```

### Configure Azure CLI

To get a tab completion in PowerShell shell, add the following code to your PowerShell profile (`$profile`):
- https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli#enable-tab-completion-on-powershell

```powershell
Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    $completion_file = New-TemporaryFile
    $env:ARGCOMPLETE_USE_TEMPFILES = 1
    $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
    $env:COMP_LINE = $wordToComplete
    $env:COMP_POINT = $cursorPosition
    $env:_ARGCOMPLETE = 1
    $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
    $env:_ARGCOMPLETE_IFS = "`n"
    $env:_ARGCOMPLETE_SHELL = 'powershell'
    az 2>&1 | Out-Null
    Get-Content $completion_file | Sort-Object | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
    }
    Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
}
```

To enter interactive mode, run `az interactive`. To exit interactive mode, press `Ctrl+D`.

```powershell
az interactive
```

To install and test AI examples run the following commands:

```powershell
az extension add --name ai-examples
az version
az vm update -h
```

