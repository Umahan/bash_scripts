# bash_scripts

# ENG

1) Copy the script to /usr/local/bin/monitor_test.sh and make it executable:
   sudo cp monitor_test.sh /usr/local/bin/monitor_test.sh
   sudo chmod 755 /usr/local/bin/monitor_test.sh
2) Create the unit and timer files in /etc/systemd/system/monitor_test.service and /etc/systemd/system/monitor_test.timer
3) Reload the systemd daemon and enable the timer:
   sudo systemctl daemon-reload
   sudo systemctl enable --now monitor_test.timer
4) Check the statuses:
   sudo systemctl status monitor_test.timer
   sudo journalctl -u monitor_test.service --no-pager
5) Logging: /var/log/monitoring.log


# RUS 

1) Скопируем скрипт в /usr/local/bin/monitor_test.sh и делаем исполняемым:
   sudo cp monitor_test.sh /usr/local/bin/monitor_test.sh
   sudo chmod 755 /usr/local/bin/monitor_test.sh
2) Создаем unit и timer в /etc/systemd/system/monitor_test.service и /etc/systemd/system/monitor_test.timer
    
3) Перезагружаем демон systemd и включаем таймер:
   sudo systemctl daemon-reload
   sudo systemctl enable --now monitor_test.timer
4) Проверяем статусы:
   sudo systemctl status monitor_test.timer
   sudo journalctl -u monitor_test.service --no-pager
5) Логирование: /var/log/monitoring.log

