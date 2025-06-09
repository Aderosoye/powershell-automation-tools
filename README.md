
# PowerShell Automation Tools

This repository contains real-world PowerShell automation scripts designed for system administrators and DevOps professionals. Each tool includes code, documentation, and output samples.

---

## 🔧 Inactive User Cleanup Tool

**Purpose:** Identify local users inactive for 30+ days, display a colored summary, generate CSV/HTML reports, and optionally disable the accounts.

### Features:
- Detects inactivity using `LastLogon`
- CSV and HTML report generation
- Optional account disabling with confirmation
- Customizable for Active Directory environments

### Sample Output:
HTML and CSV reports are included in the `inactive-user-cleanup` folder.

---

## 🩺 System Health Report Tool

**Purpose:** Quickly analyze and report the health of a Windows system using PowerShell. Ideal for sysadmins and monitoring routines.

### Features:
- CPU usage monitoring
- Memory usage summary
- System uptime checker
- OS version display
- CSV + HTML report generation
- Color-coded console feedback

---

## ⏰ Scheduled Task Auditor

**Purpose:** Monitor all scheduled tasks on a system, identify failed or disabled tasks, and generate comprehensive audit reports.

### Features:
- Lists all scheduled tasks
- Displays status, last run time, and result codes
- Highlights failed and disabled tasks
- Exports results to CSV and HTML
- Useful for backup monitoring and task diagnostics

---

## ♻️ Service Monitor & Auto-Restarter

**Purpose:** Monitor critical Windows services and ensure uptime by restarting any that are stopped. Generates logs and reports for system admins.

### Features:
- Checks status of selected services
- Automatically restarts stopped ones
- Logs all actions taken
- Exports status to CSV and HTML
- Color-coded console output

---

## 🚀 Startup Program Auditor

**Purpose:** Scan and list all programs that auto-start on system boot, including registry entries and startup folders. Highlights suspicious or unusual entries.

### Features:
- Lists all startup items from folders and registry
- Flags entries with `temp` or `appdata` paths
- Generates CSV and HTML reports
- Useful for security checks and performance tuning

---

# Get-NetworkStatusReport.ps1

This PowerShell script audits and reports the current network status of your Windows system, including:

- IP Address
- Default Gateway
- DNS Servers
- Network Interface Status
- Internet Connectivity

## Usage

```powershell
.\Get-NetworkStatusReport.ps1
```

No admin rights required. Ideal for quick diagnostics and network visibility.