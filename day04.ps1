$testin = Get-Content -Path "$($PSScriptRoot)\inputs\day04\test.in"
$datain = Get-Content -Path "$($PSScriptRoot)\inputs\day04\data.in"

function part1 {
param(
  [string]$puzzle
)
  Write-Candy "<14><u>Partie 1</></>"
  [byte[]]$md5array = $md5.computehash($puzzle.ToCharArray())
  
}

function part2 {
  param(
    [string]$puzzle
    )
    Write-Candy "<6><u>Partie 2</></>"
}

Clear-Host
Write-Candy "<b><i>Day 04</></>`n"

$md5 = [Security.cryptography.md5]::create() 
part1 -puzzle $testin
part2 -puzzle $datain