# PowerShell Script v2 - Microsoft 365 Monitoring Toolkit

Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Reports

Connect-MgGraph -Scopes "User.Read.All", "Reports.Read.All"

# Fetch all licensed users
$users = Get-MgUser -All -Property DisplayName,UserPrincipalName,AccountEnabled,AssignedLicenses | Where-Object { $_.AccountEnabled -eq $true }

# License Summary
$licenseCount = @{}
foreach ($user in $users) {
    foreach ($license in $user.AssignedLicenses) {
        $skuId = $license.SkuId
        if ($licenseCount.ContainsKey($skuId)) {
            $licenseCount[$skuId]++
        } else {
            $licenseCount[$skuId] = 1
        }
    }
}

# Output Summary
"Microsoft 365 License Summary:"
$licenseCount.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value) users" }

# Inactive User Detection (last sign-in more than 30 days ago)
$report = Get-MgReportUserCredentialUsageDetail -Period D30
$inactiveUsers = $report | Where-Object { $_.LastSignInDateTime -lt (Get-Date).AddDays(-30) }

"`nInactive users (30+ days):"
$inactiveUsers | Select-Object UserPrincipalName, LastSignInDateTime | Format-Table -AutoSize
