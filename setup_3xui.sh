#!/bin/bash

# Обновление системы
echo "Обновление системы..."
sudo apt update && sudo apt upgrade -y

# Установка необходимых зависимостей
echo "Установка необходимых зависимостей..."
sudo apt install curl wget unzip openssl -y

# Установка Xray
echo "Установка Xray..."
bash <(curl -L https://raw.githubusercontent.com/XTLS/Xray-install/main/install-release.sh)

# Установка x-ui
echo "Установка x-ui..."
bash <(curl -Ls https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh)

# Запуск x-ui для инициализации
echo "Запуск x-ui..."
x-ui start

# Настройка панели, заполните перед запуском
USERNAME="admin"
PASSWORD="123456"
PANEL_PORT="54321"
WEB_BASE_PATH=""

# Настройка имени пользователя
echo "Настройка имени пользователя..."
x-ui settings -username $USERNAME

# Настройка пароля
echo "Настройка пароля..."
x-ui settings -password $PASSWORD

# Настройка порта панели
echo "Настройка порта панели..."
x-ui settings -port $PANEL_PORT

# Настройка web base path (оставляем пустым)
echo "Настройка web base path..."
x-ui settings -web_base_path $WEB_BASE_PATH

# Перезапуск x-ui для применения настроек
echo "Перезапуск x-ui для применения настроек..."
x-ui restart

# Получение IP-адреса сервера
SERVER_IP=$(curl -s http://ipinfo.io/ip)

# Вывод информации для пользователя
echo "Установка завершена."
echo "Доступ к веб-интерфейсу: http://$SERVER_IP:$PANEL_PORT"
echo "Логин: $USERNAME"
echo "Пароль: $PASSWORD"
