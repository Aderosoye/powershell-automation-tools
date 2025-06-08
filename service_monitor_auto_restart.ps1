
# PowerShell Script - Service Monitor & Auto-Restarter

$servicesToMonitor = @("w32time", "Spooler", "Dnscache", "BITS")
$serviceReport = @()

foreach ($svcName in $servicesToMonitor) {
    $svc = Get-Service -Name $svcName -ErrorAction SilentlyContinue
    if ($null -eq $svc) {
        Write-Host "$svcName not found!" -ForegroundColor Red
        continue
    }

    if ($svc.Status -ne "Running") {
        Write-Host "$svcName is $($svc.Status). Attempting to restart..." -ForegroundColor Yellow
        try {
            Start-Service -Name $svcName -ErrorAction Stop
            $status = "Restarted"
        } catch {
            $status = "Failed to restart"
        }
    } else {
        $status = "Running"
    }

    $serviceReport += [PSCustomObject]@{
        ServiceName = $svcName
        Status      = $svc.Status
        ActionTaken = $status
        TimeStamp   = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    }
}

$serviceReport | Export-Csv -Path ".\ServiceStatusReport.csv" -NoTypeInformation
$serviceReport | ConvertTo-Html -Title "Service Monitor Report" |
    Out-File ".\ServiceStatusReport.html"
