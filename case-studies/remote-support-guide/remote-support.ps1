# remote-support.ps1
# Provides Tier 1/2 troubleshooting automation for remote support

function Clear-DNSCache { ipconfig /flushdns }
function Clear-TempFiles { Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }
function Reset-NetworkAdapter {
    Get-NetAdapter | Restart-NetAdapter -Confirm:$false
}

function Run-SupportToolkit {
    Write-Host "Running Support Toolkit..."
    Clear-DNSCache
    Clear-TempFiles
    Reset-NetworkAdapter
    systeminfo > C:\SupportLogs\SystemInfo.txt
    Write-Host "Support tasks complete. Logs saved to C:\SupportLogs"
}

Run-SupportToolkit