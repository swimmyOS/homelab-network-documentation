#!/bin/bash
DATE=$(date +%F)
mkdir -p ./configs/backups/$DATE

scp switch1:/config/startup.cfg ./configs/backups/$DATE/switch_startup.cfg
scp pfsense:/cf/conf/config.xml ./configs/backups/$DATE/pfsense_config.xml

git add .
git commit -m "Auto-backup network configs - $DATE"
git push
