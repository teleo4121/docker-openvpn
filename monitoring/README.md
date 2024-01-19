##About this folder

This folder genuielly only for me, to rekey the certificate easily without alot command lines.  
If someone found this repostory, just use it feel free.  

These files based on the circumstaince that if you already mounted volumn outside.  
You could refer this [docker-compose][https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md], see the `volume` to make it become temporary environment variable.  
```
export OVPN_DATA="./openvpn-data/conf/"   
```
Feel free to modify the path.  


#### rekey.sh  
```sh rekey.sh username```   
Don't forget there is `ContainerName_or_containerID` in this file, please change it.  
If you don't know what could you change,    
please using `docker ps -a` command line and go get the container ID.   


#### get_expire_user.sh  
This file only the reminder for me.  
I put this file in backrc, but it's your turn.  

#### check_rootkey.sh  
Same as above.   

#### monitoring_.sh   
`$FOLDER` and `EMAIL_ADDRESS` are important to send email.  
Feeling free to edit it.   


#### rekey_server.sh   
Usually **server_cn** would be the IP of your leased server if you don't do ANY DNS adjusting things.  
On the other hand, just adjust it if you know something.  
Put this volume under thie mounted folder, make sure you are able to access this file from container.  
`docker run -v /home/nekomaruchi/passvpn:/etc/openvpn --rm -it kylemanna/openvpn /bin/sh -c "rekey_server.sh"`  
Running this command and restart the whole container, then server certificate update completed.  
