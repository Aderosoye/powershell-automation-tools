
# PowerShell Script - Scheduled Task Auditor

$tasks = Get-ScheduledTask | ForEach-Object {
    $info = Get-ScheduledTaskInfo -TaskName $_.TaskName -TaskPath $_.TaskPath
    [PSCustomObject]@{
        TaskName       = $_.TaskName
        TaskPath       = $_.TaskPath
        State          = $_.State
        LastRunTime    = $info.LastRunTime
        LastResult     = $info.LastTaskResult
        IsEnabled      = $_.Enabled
    }
}

Write-Host "`n--- Scheduled Task Summary ---`n" -ForegroundColor Cyan
foreach ($task in $tasks) {
    $color = if (-not $task.IsEnabled) {
        'DarkGray'
    } elseif ($task.LastResult -ne 0) {
        'Red'
    } else {
        'Green'
    }

    Write-Host "$($task.TaskName) - Result: $($task.LastResult)" -ForegroundColor $color
}

$tasks | Export-Csv -Path ".\ScheduledTaskReport.csv" -NoTypeInformation
$tasks | ConvertTo-Html -Title "Scheduled Task Report" |
    Out-File ".\ScheduledTaskReport.html"
