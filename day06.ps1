$testin = Get-Content -Path "$($PSScriptRoot)\inputs\day06\test.in" -Raw
$datain = Get-Content -Path "$($PSScriptRoot)\inputs\day06\data.in" -Raw


function part1 {
  param(
    [string]$puzzle
  )
    $grid = [System.Collections.Generic.Dictionary]::new()
    Write-Candy "<6><u>Partie 1</></>"
  [int]$total = 0
  return $total
}

function part2 {
  
  param(
    [string]$puzzle
  )
  Write-Candy "<6><u>Partie 2</></>"
  [int]$total = 0
  
    return $total
  }

  Clear-Host
  Write-Candy "<b><i>Day 06</></>`n"

  part1 -puzzle $testin
  # part2 -puzzle $datain