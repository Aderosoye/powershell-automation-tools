
# PowerShell Script - Startup Program Auditor

$startupLocations = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
)

$startupItems = @()

foreach ($location in $startupLocations) {
    if (Test-Path $location) {
        Get-ChildItem -Path $location -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
            $startupItems += [PSCustomObject]@{
                Name     = $_.Name
                Path     = $_.FullName
                Modified = $_.LastWriteTime
                Source   = $location
            }
        }
    }
}

# Registry-based startup entries
$regPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
)

foreach ($reg in $regPaths) {
    if (Test-Path $reg) {
        Get-ItemProperty -Path $reg | ForEach-Object {
            $_.PSObject.Properties | Where-Object {
                $_.Name -ne "PSPath" -and $_.Name -ne "PSParentPath"
            } | ForEach-Object {
                $startupItems += [PSCustomObject]@{
                    Name     = $_.Name
                    Path     = $_.Value
                    Modified = ""
                    Source   = $reg
                }
            }
        }
    }
}

# Display color-coded output
Write-Host "`n--- Startup Program Summary ---`n" -ForegroundColor Cyan
foreach ($item in $startupItems) {
    $color = if ($item.Path -like "*temp*" -or $item.Path -like "*appdata*") {'Yellow'} else {'Green'}
    Write-Host "$($item.Name): $($item.Path)" -ForegroundColor $color
}

# Export Reports
$startupItems | Export-Csv -Path ".\StartupPrograms.csv" -NoTypeInformation
$startupItems | ConvertTo-Html -Title "Startup Programs Report" |
    Out-File ".\StartupPrograms.html"
