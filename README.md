PowerShell Automation Tools by Ayobamidele Aderosoye
⚙️ PowerShell Automation Tools by Ayobamidele Aderosoye

A curated set of real-world PowerShell scripts developed for system administrators, DevOps engineers, and IT automation professionals. Each script is designed for reliability, auditability, and extensibility across production and enterprise environments.

---

🔧 Inactive User Cleanup Tool

**Purpose:** Identify local users inactive for 30+ days. Provides colored console feedback and generates CSV/HTML audit reports.

Features:

- Detects inactive local/AD users via `LastLogon`
- Generates exportable reports
- Optional: auto-disable accounts with user confirmation
- Ideal for system hardening and compliance checks

📂 Location: `/inactive-user-cleanup`

---

🩺 System Health Report Tool

**Purpose:** Performs a complete system health check and presents vital metrics in both terminal and exportable formats.

Features:

- CPU, memory, uptime, and OS diagnostics
- Outputs to CSV and HTML
- Color-coded console indicators
- Great for NOC/Helpdesk triage and scheduled monitoring

📂 Location: `/system-health-report`

---

⏰ Scheduled Task Auditor

**Purpose:** Audits scheduled tasks, detects failures, and documents automation consistency across systems.

Features:

- Lists all scheduled tasks with key metadata
- Flags failures, disabled tasks, or inconsistencies
- Outputs HTML and CSV audit files
- Suitable for backup task validation and enterprise diagnostics

📂 Location: `/scheduled-task-auditor`

---

♻️ Service Monitor & Auto-Restarter

**Purpose:** Continuously monitors critical services and restarts any that fail. Creates logs and ensures maximum uptime.

Features:

- Service status monitoring
- Automatic restart logic
- CSV/HTML logs and summaries
- Reliable for server-side resilience

📂 Location: `/service-auto-restart`

---

🚀 Startup Program Auditor

**Purpose:** Scans system startup entries and flags unusual or suspicious programs that auto-load on boot.

Features:

- Enumerates programs from registry and folders
- Flags paths from temp/appdata/suspicious origins
- Generates detailed CSV and HTML exports
- Helps with malware detection and performance cleanup

📂 Location: `/startup-auditor`

---

🌐 Get-NetworkStatusReport.ps1

**Purpose:** Audits and reports your Windows system’s network configuration, helping sysadmins quickly assess connectivity status.

Features:

- Extracts IP Address, Gateway, and DNS
- Displays all network interfaces with link speed and status
- Performs an internet connectivity test (ping to 8.8.8.8)
- Clean console output with table formatting

Usage:

.\Get-NetworkStatusReport.ps1

📂 Location: `/Get-NetworkStatusReport`

---

🧠 PowerTask - Module 2

**Purpose:** Reads scheduled tasks from a JSON file and runs due PowerShell scripts based on defined time schedules.

Features:

- JSON-based task scheduling
- Checks if script is due to run by time
- Prevents duplicate runs within a day
- Executes the specified script using PowerShell
- Updates `lastRun` timestamp to track execution

Sample tasks.json Entry:

[
  {
    "name": "System Health Check",
    "script": "C:\Scripts\health.ps1",
    "schedule": "09:00",
    "lastRun": ""
  },
  {
    "name": "User Audit",
    "script": "C:\Scripts\audit.ps1",
    "schedule": "14:30",
    "lastRun": ""
  }
]

📂 Location: `/PowerTask-Module2`
