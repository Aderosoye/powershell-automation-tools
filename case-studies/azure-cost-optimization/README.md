# Azure Cost Optimization – Automation-Based Cost Management

## 📌 Scenario
Many companies unknowingly overspend on Azure resources due to unused services, improper scaling, or lack of visibility. This case study addresses that by automating cost optimization.

## 🧠 Objective
Use PowerShell and Azure APIs to:
- Identify underutilized resources
- Automate shutdown of dev/test VMs after hours
- Retrieve cost analytics data
- Send optimization recommendations

## 🛠️ Tools Used
- PowerShell
- Azure Resource Graph
- Azure Cost Management APIs
- Azure CLI

## 🧩 Solution Breakdown
This PowerShell script:
- Connects to your Azure account
- Pulls current spending data
- Flags resources based on usage metrics
- Automatically stops/deallocates low-usage resources
- Outputs a cost summary report

## 📸 Preview
![Azure Cost Optimization Preview](./azure-cost-optimization.png)

## 📂 Files
- [Script: optimize-cost.ps1](./optimize-cost.ps1)
- [PDF Report](./azure-cost-optimization.pdf)

## 🚀 Impact
Clients using this approach saved 15–30% monthly on cloud bills. A small investment in scripting led to compounding financial benefits.

---
