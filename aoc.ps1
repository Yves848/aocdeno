class ConfigGenerator : System.Management.Automation.IValidateSetValuesGenerator {
  [string[]] GetValidValues() {
    $path = "$($PSScriptRoot)\input"
    Write-Host $path
    if (-not (Test-Path -LiteralPath $path -PathType Container )) {
      return @()
    }

    return Get-ChildItem -Directory -LiteralPath $path | Select-Object -ExpandProperty BaseName
  }
}

function day {
  param(
    [ValidateSet([ConfigGenerator])]
    [string]$day,

    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ExtraArgs
  )
}