#!/bin/bash
#Script for purge

#Homework
cd /src

#Duplicate example
cp -f ccu_v3.py.example ccu_v3_custom.py

#Get and set config
echo "-> Apply config"
fileconfig="/var/local/config_purge"
hostakamai=`grep "hostname" $fileconfig | sed 's/^.*=//'`
networkakamai=`grep "network" $fileconfig | sed 's/^.*=//'`
sed -i -e "s/hostakamai/$hostakamai/g" ccu_v3_custom.py
sed -i -e "s|/ccu/v3/invalidate/url/network|/ccu/v3/invalidate/$networkakamai|g" ccu_v3_custom.py

#Add URL in file purge
echo "-> Read URL list for purge file"
fileurl="/var/local/list_urls"
while read -r line
do
	url="$line"
        echo "--> $url"
listpurgeurl+="\n\t\t\t\t\"$url\","
done < "$fileurl"

sed -i -e "s|\"objects\" : \[|\"objects\" : \[ ${listpurgeurl::-1}|g" ccu_v3_custom.py

#Launch purge URL
echo "-> Launch fast purge"
cp -f ccu_v3_custom.py /opt/examples/python/ccu_v3_custom.py
cd /opt/examples/python/
returnapi=`python ccu_v3_custom.py`
echo "-> Return API : $returnapi"
if grep "'httpStatus': 201" <<<$returnapi
then
	echo "\O/ Request Purge OK"
        sleep 2
else
        echo ";-O Request Purge failed"
        exit
fi
