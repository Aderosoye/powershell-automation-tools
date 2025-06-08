
# PowerShell Challenge 11 - Inactive User Cleanup & Summary Tool

$today = Get-Date
$users = Get-LocalUser

$inactiveUsers = foreach ($user in $users) {
    if ($user.Enabled -and $user.LastLogon) {
        $daysInactive = ($today - $user.LastLogon).Days
        if ($daysInactive -gt 30) {
            [PSCustomObject]@{
                Name         = $user.Name
                LastLogon    = $user.LastLogon
                DaysInactive = $daysInactive
                Enabled      = $user.Enabled
            }
        }
    }
}

Write-Host "`n--- Inactive Users Summary ---`n" -ForegroundColor Cyan
foreach ($u in $inactiveUsers) {
    $color = if ($u.DaysInactive -gt 60) { "Red" } else { "Yellow" }
    Write-Host "$($u.Name): Last login $($u.LastLogon) - $($u.DaysInactive) days ago" -ForegroundColor $color
}

$inactiveUsers | Export-Csv -Path ".\InactiveUsers.csv" -NoTypeInformation
$inactiveUsers | ConvertTo-Html -Property Name,LastLogon,DaysInactive,Enabled -Title "Inactive Users Report" |
    Out-File ".\InactiveUsers.html"

foreach ($user in $inactiveUsers) {
    $confirmation = Read-Host "Disable user $($user.Name)? (y/n)"
    if ($confirmation -eq 'y') {
        Disable-LocalUser -Name $user.Name
        Write-Host "$($user.Name) has been disabled." -ForegroundColor DarkGray
    }
}
