
# PowerShell Script - System Health Report Tool

$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-Counter '\Processor(_Total)\% Processor Time'
$mem = Get-CimInstance Win32_OperatingSystem
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

$totalMem = [math]::Round($mem.TotalVisibleMemorySize / 1MB, 2)
$freeMem = [math]::Round($mem.FreePhysicalMemory / 1MB, 2)
$usedMem = [math]::Round($totalMem - $freeMem, 2)
$cpuUsage = [math]::Round($cpu.CounterSamples.CookedValue, 2)
$uptime = ([datetime]::Now - $os.LastBootUpTime).Days

Write-Host "CPU Usage: $cpuUsage%" -ForegroundColor (if ($cpuUsage -gt 80) {'Red'} elseif ($cpuUsage -gt 50) {'Yellow'} else {'Green'})
Write-Host "Memory Used: $usedMem GB / $totalMem GB" -ForegroundColor (if ($usedMem -gt ($totalMem * 0.8)) {'Red'} elseif ($usedMem -gt ($totalMem * 0.6)) {'Yellow'} else {'Green'})
Write-Host "System Uptime: $uptime days" -ForegroundColor (if ($uptime -gt 7) {'Yellow'} else {'Green'})

$report = [PSCustomObject]@{
    CPUUsage    = "$cpuUsage%"
    MemoryUsed  = "$usedMem GB"
    TotalMemory = "$totalMem GB"
    UptimeDays  = $uptime
    OSVersion   = $os.Caption
}

$report | Export-Csv -Path ".\SystemHealthReport.csv" -NoTypeInformation
$report | ConvertTo-Html -Title "System Health Report" | Out-File ".\SystemHealthReport.html"
