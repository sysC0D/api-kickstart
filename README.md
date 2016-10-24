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
 - filename "list_urls" -> liste URL to purge 
Sample file for list_url : 
> /index.html
> /style/style.css
> /js/

## Launch Docker
### Docker line
`docker run -d /your/path/with/config:/var/local --name api-akamai sysC0D/api-kickstart`   

### Docker-Compose 
`api-akamai:
 image: "sysC0D/api-kickstart"
 restart: always
 volumes:
 - /your/path/with/config:/var/local:rw`

