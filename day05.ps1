$testin = Get-Content -Path "$($PSScriptRoot)\inputs\day05\test.in" -Raw
$datain = Get-Content -Path "$($PSScriptRoot)\inputs\day05\data.in" -Raw

<#
Part 1
A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

Part 2
------
  Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
#>

class utils {
  static [bool] three([string]$target) {
    $set = [System.Collections.Generic.HashSet[string]]::new([string[]]@("a", "e", "i", "o", "u"))
    $found = [System.Collections.Generic.List[string]]::new()
    
    foreach ($s in $target.ToCharArray()) {
      if ($set.Contains($s)) {
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
    while ($i -lt $target.Length - 1) {
      if ($target[$i] -eq $target[$i + 1]) {
        return $true
      }
      $i++
    }
    return $false
  }

  static [bool] pairbetween([string]$target) {
    $i = 0;
    while ($i -lt $target.Length - 2) {
      $pair = $target[$i]
      
      if ($pair -eq $target[$i + 2]) {
        return $true
      }
      $i++
    }
    return $false
  }

  static [bool] pairswooverlap([string]$target) {
    $i = 0
    while ($i -lt $target.Length - 1) {
      $pair = $target.Substring($i, 2)
      $temp = $target.Substring($i + 2)
      if ($temp.Contains($pair)) {
        return $true
      }
      $i++
    }
    return $false
  }

  static [bool] forbiden([string]$target) {
    $set = [System.Collections.Generic.HashSet[string]]::new([string[]]@("ab", "cd", "pq", "xy"))
    foreach ($s in $set) {
      if ($target.Contains($s)) {
        return $true
      }
    }
    return $false
  }
}
function part1 {
  param(
    [string]$puzzle
  )
  [int]$total = 0
  Write-Candy "<14><u>Partie 1</></>"
  $lines = $puzzle -split "`r?`n" 
  $lines | ForEach-Object {
    Write-Candy "Is <5><i>$($_)</></> nice ?"
    if ([utils]::three($_)) {
      if ([utils]::pairs($_)) {
        if (-not [utils]::forbiden($_)) {
          Write-Candy "<green>$($_)</>" 
          $null = $total++
        } 
      }
    }
  }
  return $total
}

function part2 {
  
  param(
    [string]$puzzle
  )
  Write-Candy "<6><u>Partie 2</></>"
   [int]$total = 0
  $lines = $puzzle -split "`r?`n" 
  $lines | ForEach-Object {
    Write-Candy "Is <5><i>$($_)</></> nice ?"
    if ([utils]::pairswooverlap($_)) {
      if ([utils]::pairbetween($_)) {
          Write-Candy "<green>$($_)</>" 
          $null = $total++
        }
      }
    }
    return $total
  }

  Clear-Host
  Write-Candy "<b><i>Day 05</></>`n"

  # part1 -puzzle $testin
  part2 -puzzle $datain