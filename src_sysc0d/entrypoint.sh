#!/bin/sh

# Generate conf OpenVPN
if [ ! -f /root/.edgerc ]; then
	/src/genere_config.sh
fi

# Start Supervisord
/usr/bin/supervisord
