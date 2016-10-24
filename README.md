api-kickstart
=============

From Git : [akamai-open/api-kickstart](https://github.com/akamai-open/api-kickstart) 
This repositarie is only dedicated to Docker and optimize for Fast-Purge in Python  
Docker api-kickstart can running in background (in next example, initialize with Docker-compose)

Before start installation for Fast-Purge please read [OPEN API Administration Application](https://developer.akamai.com/introduction/Luna_Setup.html) for download Exporting Client Credentials

# Installation
## Source directory
Create directory to contain client credentials and list url purge :
 - filename "cc.txt" ->  client credentials
 - filename "list_urls" -> list URL to purge
 - filename "config_purge" -> hostname and network 
Sample file for list_url :
```/index.html
/style/style.css
/js/
```
Sample file for config_purge :
```hostname=your.hostname.com
network=staging (or production)
```

## Launch Docker
### Docker line
`docker run -d -v /your/path/with/config:/var/local --name api-akamai sysC0D/api-kickstart`   

### Docker-Compose 
```api-akamai:
 image: "sysC0D/api-kickstart"
 restart: always
 volumes:
 - /your/path/with/config:/var/local:rw
```

## Configure Docker
After first launch Docker, your .edgerc is generated automatically -> for more information, please see [doc](https://developer.akamai.com/introduction/Conf_Client.html)
For verify your configuration, please run :
`docker exec -it api-akamai python verify_creds.py`
If you have problem please update your cc.txt and run next commands :
```docker exec -it api-akamai python gen_edgerc.py -s default -f /var/local/cc.txt
docker exec -it api-akamai python gen_edgerc.py -s ccu -f /var/local/cc.txt```

##Launch Purge
Just exec next command, and if you have code 201 this is a success \0/
`docker exec -it api-akamai /src/fast-purge.sh`
