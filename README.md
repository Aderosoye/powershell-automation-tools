
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
