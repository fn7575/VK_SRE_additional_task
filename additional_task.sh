#!bin/bash

# Выполнять из под root (потребуется для 20 и 22 строк)
# Потребуется готовый ключ (путь до ключа вводится с клавиатуры)
# Настройка для crontab:  0 8 * * * - каждый день в 8 утра

# Введем переменные
echo "Введите адрес директории на удаленной машине в формате /source/path"
read remote_path

echo "Введите данные удаленной машины в формате user@host"
echo " должен быть настроен доступ по ключу! "
read user_host

echo "Введите путь до ключа в формате /sourse/path"
read ssh_path

# Создаем 2 файла (точное количество в задании не указано)
sudo touch /var/log/f1.log
echo "some information" > /var/log/f1.log
sudo touch /var/log/f2.log
echo "some information1" > /var/log/f2.log

# Отправка на удаленную машину
scp /var/log/f1.log $user_host:$remote_path
scp /var/log/f2.log $user_host:$remote_path

# Удаляем файлы старше 7 дней
ssh -i $ssh_path $user_host 'find $remote_path -type f -mtime +7 -delete'




