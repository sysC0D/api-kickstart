#!/bin/bash
#Genere EdgeGrid Credentials

#Genere Akamai OPEN API EdgeGrid Credentials
echo "Genere EdgeGrid Credentials"
cd /opt/example/python
python gen_edgerc.py -s default -f /var/local/cc.txt
python gen_edgerc.py -s ccu -f /var/local/cc.txt

#Verify creds
echo "Verify credentials"
python verify_creds.py
