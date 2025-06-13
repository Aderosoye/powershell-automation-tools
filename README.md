⚙️ PowerShell Automation Tools by Ayobamidele Aderosoye

A curated set of real-world PowerShell scripts developed for system administrators, DevOps engineers, and IT automation professionals. Each script is designed for reliability, auditability, and extensibility across production and enterprise environments.

---

🔧 Inactive User Cleanup Tool  
📂 Location: `/inactive-user-cleanup`

**Purpose:** Identify local users inactive for 30+ days. Provides colored console feedback and generates CSV/HTML audit reports.

- Detects inactive local/AD users via `LastLogon`
- Generates exportable reports
- Optional: auto-disable accounts with user confirmation
- Ideal for system hardening and compliance checks

---

🩺 System Health Report Tool  
📂 Location: `/system-health-report`

**Purpose:** Performs a complete system health check and presents vital metrics in both terminal and exportable formats.

- CPU, memory, uptime, and OS diagnostics
- Outputs to CSV and HTML
- Color-coded console indicators
- Great for NOC/Helpdesk triage and scheduled monitoring

---

⏰ Scheduled Task Auditor  
📂 Location: `/scheduled-task-auditor`

**Purpose:** Audits scheduled tasks, detects failures, and documents automation consistency across systems.

- Lists all scheduled tasks with key metadata
- Flags failures, disabled tasks, or inconsistencies
- Outputs HTML and CSV audit files
- Suitable for backup task validation and enterprise diagnostics

---

♻️ Service Monitor & Auto-Restarter  
📂 Location: `/service-auto-restart`

**Purpose:** Continuously monitors critical services and restarts any that fail. Creates logs and ensures maximum uptime.

- Service status monitoring
- Automatic restart logic
- CSV/HTML logs and summaries
- Reliable for server-side resilience

---

🚀 Startup Program Auditor  
📂 Location: `/startup-auditor`

**Purpose:** Scans system startup entries and flags unusual or suspicious programs that auto-load on boot.

- Enumerates programs from registry and folders
- Flags paths from temp/appdata/suspicious origins
- Generates detailed CSV and HTML exports
- Helps with malware detection and performance cleanup

---

🌐 Get-NetworkStatusReport.ps1  
📂 Location: `/Get-NetworkStatusReport`

**Purpose:** Audits and reports your Windows system’s network configuration, helping sysadmins quickly assess connectivity status.

- Extracts IP Address, Gateway, and DNS
- Displays all network interfaces with link speed and status
- Performs an internet connectivity test (ping to 8.8.8.8)
- Clean console output with table formatting

Usage:  
`.\Get-NetworkStatusReport.ps1`

---

🧠 PowerTask - Module 2  
📂 Location: `/PowerTask-Module2`

**Purpose:** Reads scheduled tasks from a JSON file and runs due PowerShell scripts based on defined time schedules.

- JSON-based task scheduling
- Checks if script is due to run by time
- Prevents duplicate runs within a day
- Executes the specified script using PowerShell
- Updates `lastRun` timestamp to track execution

---

📊 Azure Cost Optimization  
📂 Location: `/case-studies/azure-cost-optimization`

**Purpose:** Automates Azure cost management by identifying underutilized resources and shutting them down automatically.

- Connects to Azure and pulls usage data
- Detects low-CPU VMs
- Stops or deallocates wasteful resources
- Outputs optimization report

Assets:  
[optimize-cost.ps1](./case-studies/azure-cost-optimization/optimize-cost.ps1) •  
[PDF Guide](./case-studies/azure-cost-optimization/azure-cost-optimization.pdf) •  
![Preview](./case-studies/azure-cost-optimization/azure-cost-optimization.png)

---

🛠️ Remote Support Troubleshooting Toolkit  
📂 Location: `/case-studies/remote-support-guide`

**Purpose:** Provides a Tier 1/2 support script that flushes DNS, clears temp files, resets network adapters, and logs system info.

- Built for helpdesk and remote techs
- Includes menu-driven support automation
- Logs output for audits and escalations

Assets:  
[remote-support.ps1](./case-studies/remote-support-guide/remote-support.ps1) •  
[PDF Guide](./case-studies/remote-support-guide/remote-support-guide.pdf) •  
![Preview](./case-studies/remote-support-guide/remote-support-guide.png)

---

🔁 More projects dropping soon. Stay tuned.

---



🧩 Schedule Task UI Component  

📂 Location: `/PowerTask-ScheduleForm`



**Purpose:** React-based frontend component to allow users to schedule PowerShell or Bash scripts from the web.



- Fields: Script Name, Language, Frequency, Time, Date, Repeat, Enable toggle

- Built with TailwindCSS + ShadCN UI

- Submit button triggers task configuration logic (backend ready)

- Clean form UI with modern styling



Assets:  

[ScheduleTaskForm.tsx](./PowerTask-ScheduleForm/ScheduleTaskForm.tsx) •  

![Preview Image](./PowerTask-ScheduleForm/schedule_task_preview.png)

⚡ Want 4 ready-made scripts + 1 doc template?
Buy Toolkit: https://adroyphill.gumroad.com/l/powershell-automation-toolkit
