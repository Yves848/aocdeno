$testin = Get-Content -Path "$($PSScriptRoot)\inputs\day05\test.in" -Raw
$datain = Get-Content -Path "$($PSScriptRoot)\inputs\day05\data.in" -Raw

class utils {
  static [bool] three([string]$target)
  {
    $set = [System.Collections.Generic.HashSet[string]]::new([string[]]@("a", "e", "i", "o", "u"))
    $found = [System.Collections.Generic.List[string]]::new()
    
    foreach($s in $set) {
      if ($target.Contains($s)) {
        $found.Add($s)
        if ($found.Count -ge 3) {
          return $true
        }
      }
    }
     return $false
  }

  static [bool] pairs([string]$target) {
    $i = 0;
    while ($i -lt $target.Length -1) {
      if ($target[$i] -eq $target[$i+1]) {
        return $true
      }
      $i++
    }
    return $false
  }
}
function part1 {
param(
  [string]$puzzle
)
  Write-Candy "<14><u>Partie 1</></>"
  $lines = $puzzle -split "`r?`n" 
  $lines | ForEach-Object {
    if ([utils]::three($_)) {
      if ([utils]::pairs($_)) {
        Write-Candy "<green>$($_)</>"
      } 
    }
  }
}

function part2 {
  param(
    [string]$puzzle
    )
    Write-Candy "<6><u>Partie 2</></>"
}

Clear-Host
Write-Candy "<b><i>Day 05</></>`n"

part1 -puzzle $testin
part2 -puzzle $datain