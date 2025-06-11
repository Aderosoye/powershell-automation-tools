# optimize-cost.ps1
# Automates Azure resource optimization by identifying and managing underutilized resources

Connect-AzAccount

# Retrieve all VMs
$vms = Get-AzVM

foreach ($vm in $vms) {
    $metrics = Get-AzMetric -ResourceId $vm.Id -TimeGrain "PT1H" -MetricNames "Percentage CPU" -DetailedOutput
    $avgCpu = ($metrics.Data | Measure-Object Average -Average).Average

    if ($avgCpu -lt 10) {
        Write-Output "Stopping underutilized VM: $($vm.Name)"
        Stop-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName -Force
    }
}