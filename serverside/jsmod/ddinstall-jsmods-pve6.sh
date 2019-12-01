#!/bin/bash
# backups
bakdate=$(date --iso-8601=seconds | tr : -)

cp /usr/share/pve-manager/js/pvemanagerlib.js /usr/share/pve-manager/js/pvemanagerlib.js.bak-$bakdate
cp /usr/share/javascript/extjs/charts.js /usr/share/javascript/extjs/charts.js.bak-$bakdate
cp /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.bak-$bakdate

# pve-manager - apt --reinstall install pve-manager
sed -i "s/'background-color': 'white'/'background-color': '#23272a'/g" /usr/share/pve-manager/js/pvemanagerlib.js

#proxmox-widget-toolkit - apt --reinstall install proxmox-widget-toolkit
sed -i "s/defaultColor: '#c2ddf2',/defaultColor: '#7289da',/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
sed -i "s/backgroundColor: '#f5f5f5',/backgroundColor: '#2c2f33',/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js

# charts.js
sed -i 's/background:"white"/background:"#23272a"/g' /usr/share/javascript/extjs/charts.js
sed -i 's/label:{x:0,y:0,textBaseline:"middle",textAlign:"center",fontSize:"default",fontFamily:"default",fontWeight:"default",fillStyle:"black"}/label:{x:0,y:0,textBaseline:"middle",textAlign:"center",fontSize:"default",fontFamily:"default",fontWeight:"default",fillStyle:"black",color:"white"}/g' /usr/share/javascript/extjs/charts.js
sed -i 's/title:{fillStyle:"black",fontSize:"default*1.23",fontFamily:"default",fontWeight:"default"}/title:{fillStyle:"black",fontSize:"default*1.23",fontFamily:"default",fontWeight:"default",color:"white"}/g' /usr/share/javascript/extjs/charts.js
sed -i 's/grid:{strokeStyle:"rgb(221, 221, 221)"}/grid:{strokeStyle:"rgba(44, 47, 51, 1)"}/g' /usr/share/javascript/extjs/charts.js
sed -i 's/sprites:{text:{fontSize:"default",fontWeight:"default",fontFamily:"default",fillStyle:"black"}}/sprites:{text:{fontSize:"default",fontWeight:"default",fontFamily:"default",fillStyle:"black",color:"white"}}/g' /usr/share/javascript/extjs/charts.js

systemctl restart pveproxy.service

exit 0
