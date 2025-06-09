
# PowerTask - task-runner.ps1
# Reads scheduled tasks from tasks.json and runs due scripts

$taskFile = ".\tasks.json"
if (-Not (Test-Path $taskFile)) {
    Write-Error "Task file not found: $taskFile"
    exit
}

# Load tasks from JSON
$tasks = Get-Content $taskFile | ConvertFrom-Json
$currentTime = (Get-Date).ToString("HH:mm")
$today = (Get-Date).ToString("yyyy-MM-dd")

foreach ($task in $tasks) {
    $lastRunDate = ($task.lastRun -split " ")[0]

    if ($task.schedule -eq $currentTime -and $lastRunDate -ne $today) {
        Write-Host "Running task: $($task.name)" -ForegroundColor Cyan
        try {
            Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$($task.script)`"" -NoNewWindow -Wait
            $task.lastRun = Get-Date
            Write-Host "Task completed: $($task.name)" -ForegroundColor Green
        }
        catch {
            Write-Error "Failed to run task: $($task.name) - $_"
        }
    }
}

# Save updated task file
$tasks | ConvertTo-Json -Depth 3 | Set-Content $taskFile
