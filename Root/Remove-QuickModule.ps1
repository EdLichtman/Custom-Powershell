function Remove-QuickModule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string] $NestedModule
    )
    Invoke-Expression ". '$PSScriptRoot\Reserved\PrivateFunctions.ps1'"

    Assert-ModuleAlreadyExists -NestedModule $NestedModule
    $ModuleDirectory = Get-NestedModuleLocation -NestedModule $NestedModule
    
    $Continue = $Host.UI.PromptForChoice("Module found at: '$ModuleDirectory'", "Are you sure you would like to delete?", @('&Yes','&No'), 1);
    if ($Continue -eq 0) {
        Remove-Item $ModuleDirectory -Recurse
        Update-QuickModuleCLI
    }
}