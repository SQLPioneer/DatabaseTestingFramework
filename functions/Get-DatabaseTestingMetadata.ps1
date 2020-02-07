Function Get-DatabaseTestingMetadata {
    param( 
      [cmdletbinding()]
      [Parameter(Mandatory=$true)] [string]$Path
    )
    $configRaw = 'path: "' + $Path + '",'
    $file = Get-Content $Path
    $in = $false
    foreach ($line in $file) {
    if ($line -eq "/* Test Config") {
      $in = $true
      $ln = $line.ReadCount
      }
    elseif ($line -eq "*/") {
      $in = $False
      }
    if ($in -eq $true) {
      if ($line.ReadCount -ne $ln) {
        $configRaw = $configRaw + ' ' + $line
        }
      }
    }
    $configRaw = $configRaw
    $configRaw
    # $configRaw.Trim() | ConvertFrom-Json
   }
