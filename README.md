# SQL Data Folder Daily Backup Script (.bat)

This batch script automates the daily backup of a local SQL database folder (e.g., for ERP applications like Al-Motamem), and stores the backup in a network-shared location with a folder named after the current date.

## ⚙️ How It Works:
1. Stops the SQL Server service to avoid file locks
2. Copies the SQL data folder to a shared folder with the format: `YYYY-MM-DD`
3. Restarts SQL Server (and optionally any other dependent services)

## 📌 Customize It:
- Replace `source_folder` with your SQL data path (e.g., `C:\Program Files\ERP\Data`)
- Replace `destination_folder` with your network share (e.g., `\\ServerName\Backups`)
- Add any extra services that need restarting under the `rem` section

## 📅 Tip:
Use Windows Task Scheduler to run this script automatically every day.

---
Author: Hatem Yahia Elkady  
LinkedIn: [linkedin.com/in/hatem-yahia-572509b6](https://www.linkedin.com/in/hatem-yahia-572509b6)
