# CollegeApp 


1. Write Dockerfile and run docker image to execute java program  
    a.  In interactive console mode
   
    b.  in Deamon mode
3. Log into docker container to see logs for debug purpose and locate jars path, locate logs path 

4. Write and run docker file to run java program with environment variables like Port number (8081), or any logs location (c://container/logs ) etc 
5. Write and run docker file to run java program   and the java program should  write logs to the host system which is  outside the container using mount  (Ex: write logs to host system with path c://container/logs)

Pre requiste steps:
1. Install Docker
2. Install Kubectl
3. Install minikube

-> Download Dockerfile and jar from this repo  to the same folder
-> Run below commands in terminal with same path as previous downloaded files

Ex: 1
sol:
 docker build -t  workshop .
 docker run -p 8081:8081 workshop   (Interactive mode)
 
Open in broswer and Enter : http://localhost:8081/workshop
you should see Welcome message

docker run -p 8081:8081 -d  workshop (Deamon mode)

Ex: 2
    docker build -t  workshop .
    docker run -p 8081:8081 -d workshop
    docker ps  (Take container ID from output)
    docker logs  -f  <container ID>    (to Check logs)
    docker  exec -it <container ID>  /bin/bash  (locate your jar file)

Ex: 3
    docker build -t  workshop .
    docker run -p 8082:8082 --env JAVA_OPTS=-Dspring.port=8082 -d workshop    
    Open in broswer and Enter : http://localhost:8082/workshop
you should see Welcome message



Ex: 4
    docker build -t  workshop .


Use   demo-1.0.0-SNAPSHOT.jar    for upload files 

FOR upload the endpoint is   


curl --location 'http://localhost:8081/upload' \
--form 'file=@"/C:/Users/NMR020/Downloads/Dockerfile.txt"'

![image](https://github.com/user-attachments/assets/b6f9f234-3874-4046-bd40-3918e1f822a0)
