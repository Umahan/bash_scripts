# 🛠️ Test Process Monitor
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Systemd](https://img.shields.io/badge/Systemd-008736?style=flat&logo=systemd&logoColor=white)
![Monitoring](https://img.shields.io/badge/Monitoring-00BFFF?style=flat&logo=prometheus&logoColor=white)
![Security](https://img.shields.io/badge/Security-FF6B6B?style=flat-square&logo=security&logoColor=white)

## 📖 Project Overview

# EN

<details>
<summary><b>🔍 Click to expand prerequisites setup</b></summary>

**Test Process Monitor** is a reliable and lightweight solution for monitoring critical processes in Linux systems. This project was born from a real need for automated service health tracking and instant problem notification.

As a system administrator, I often encountered situations where processes would "silently" crash or restart without my knowledge

## 🎯 What This Project Does
The project provides an intelligent monitoring system that:

- 🚀 Automatically starts on system boot via systemd
- ⏰ Checks target process status every minute
- 🔔 Notifies about process restarts through logging
- 🌐 Verifies external monitoring server availability
- 🔒 Runs without root privileges under a dedicated system user

## 🛡️ Security as a Priority
- Special attention is given to security:
- Dedicated monitor user with minimal privileges
- No root privileges required for the script
- Protected logs with access control
- HTTPS for all external requests

## 🚀 Technical Requirements
### ✅ What the monitoring system can do
1. Auto-start on system boot — using systemd for maximum reliability
2. Minute-by-minute checks — accuracy is everything
3. HTTPS health checks to external server — security first
4. Detailed restart logging — for subsequent analysis
5. Monitoring server availability control — to avoid missing failures
6. Systemd integration — modern approach to service management
7. Operation without root rights — principle of least privilege
  
</details>
