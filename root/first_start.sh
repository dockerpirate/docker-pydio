#!/bin/sh

cd /data2
git config --global user.email "abc@email.com"
git config --global user.name "abc"
git init .  

# vorhandene Dateien einfügen
git add . 

# Dateien markieren
git commit -a -m "Initial commit"  

# Cron erzeugen
echo -n "#!/bin/sh" >> /etc/periodic/15min/git 
echo -n -e \n "cd /data2 && git commit -a -m "Initial commit"" >> /etc/periodic/15min/git 

chmod +x /etc/periodic/15min/git

mv /base.conf.php /config/www/pydio/
reboot
