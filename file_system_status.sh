# df -H --> show disk usage
# egrep -v --> remove unwanted lines
# awk '{print $5}' --> extract disk usage %
# tr -d % --> remove percent sign


#!/bin/bash

# monitoring the free fs space disk

FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "sda2" | awk '{print $5}' | tr -d %)

if [[ $FU -ge 80 ]]
then
        echo "warning, disk space is low"
else
        echo "all good"
fi
