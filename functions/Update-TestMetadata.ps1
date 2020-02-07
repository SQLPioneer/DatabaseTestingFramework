Function Update-TestMetadata {
    param(
      [cmdletbinding()]
      [Parameter(Mandatory=$true)] [string]$TestDirectory
    )
  #   $jsonBase = @{}
  #   $array = @{}
  #   $configPrivate = @'{
  #   "TestPath" = $TestDirectory;
  #   columns: []
  # }' | ConvertFrom-Json
    foreach ($file in Get-ChildItem -path $TestDirectory| Sort-Object) {
      $val = Get-DatabaseTestingMetadata -Path $file
      $configPrivate = $configPrivate | Add-Member -Type NoteProperty -Name $val
    }
    $configPrivate 
    Write-Output $configPrivate
  }
  