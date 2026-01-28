# 🛠️ Test Process Monitor
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Systemd](https://img.shields.io/badge/Systemd-008736?style=flat&logo=systemd&logoColor=white)
![Monitoring](https://img.shields.io/badge/Monitoring-00BFFF?style=flat&logo=prometheus&logoColor=white)
![Security](https://img.shields.io/badge/Security-FF6B6B?style=flat-square&logo=security&logoColor=white)

## 📖 Project Overview



<details>
<summary><b>🔍 Click to expand description </b></summary>

# EN

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
Special attention is given to security:
- Dedicated monitor user with minimal privileges
- No root privileges required for the script
- Protected logs with access control
- HTTPS for all external requests

## 🚀 Technical Requirements
### ✅ What the monitoring system can do
1. Auto-start on system boot - using systemd for maximum reliability
2. Minute-by-minute checks - accuracy is everything
3. HTTPS health checks to external server - security first
4. Detailed restart logging - for subsequent analysis
5. Monitoring server availability control - to avoid missing failures
6. Systemd integration - modern approach to service management
7. Operation without root rights - principle of least privilege

# RU
  
**Test Process Monitor** - это надежное и легковесное решение для мониторинга критически важных процессов в Linux-системах. Этот проект возник из реальной потребности в автоматизированном отслеживании работоспособности сервисов и мгновенном уведомлении о проблемах.

Как системный администратор, я часто сталкивался с ситуациями, когда процессы "тихо" падали или перезапускались без моего ведома.

## 🎯 Что делает этот проект
Проект представляет собой интеллектуальную систему мониторинга, которая:

- 🚀 Автоматически запускается при старте системы через systemd
- ⏰ Ежеминутно проверяет состояние целевого процесса
- 🔔 Уведомляет о перезапусках процесса через логирование
- 🌐 Проверяет доступность внешнего сервера мониторинга
- 🔒 Работает без root-прав под выделенным системным пользователем

## 🛡️ Безопасность как приоритет
Special attention is given to security:
- Выделенный пользователь monitor с минимальными правами
- Никаких root-привилегий для скрипта
- Защищенные логи с контролем доступа
- HTTPS для всех внешних запросов

## 🚀 Технические требования
### ✅ Что система мониторинга умеет делать
1. Автозапуск при старте системы - используем systemd для максимальной надежности
2. Ежеминутная проверка - точность важнее всего
3. HTTPS-чекапы на внешний сервер - безопасность на первом месте
4. Детальное логирование перезапусков - для последующего анализа
5. Контроль доступности мониторинг-сервера - чтобы не пропустить сбои
6. Интеграция с systemd - современный подход к управлению сервисами
7. Работа без root-прав - принцип минимальных привилегий


</details>


# 🚀 Quick Installation

## 1. Script Placement
```
sudo cp monitor_test.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/monitor_test.sh
```
## 2. Creating a System User
```
sudo useradd -r -s /bin/false monitor
```
## 3. File Configuration
```
# Log-file
sudo touch /var/log/monitoring.log
sudo chown monitor:monitor /var/log/monitoring.log
sudo chmod 644 /var/log/monitoring.log
```
```
# PID file
sudo touch /var/run/monitor_test.pid
sudo chown monitor:monitor /var/run/monitor_test.pid
sudo chmod 644 /var/run/monitor_test.pid
```
## 4. Systemd Activation
```
sudo systemctl daemon-reload
sudo systemctl enable --now monitor_test.timer
```

# ⚙️ Configuration Files
- 📄 **Service File:** `/etc/systemd/system/monitor_test.service`
- ⏰ **Timer File:** `/etc/systemd/system/monitor_test.timer`
- 🐚 **Main Script:** `/usr/local/bin/monitor_test.sh`

# 📊 Log Examples
```
2024-01-15 10:30:00 - Process 'test' started or first check. PID: 1234
2024-01-15 10:35:00 - Process 'test' was restarted. New PID: 5678
2024-01-15 10:40:00 - Monitoring server is unavailable
```

# 🐛 Troubleshooting

1. **Timer Status Check**
```
sudo systemctl status monitor_test.timer
```
2. **Viewing Logs**
```
sudo journalctl -u monitor_test.service -n 10
```
3. **Manual Script Execution**
```
sudo -u monitor /usr/local/bin/monitor_test.sh
```
