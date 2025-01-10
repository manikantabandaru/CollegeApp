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

-> Use   demo-1.0.0-SNAPSHOT.jar    for upload files 

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
    docker  exec -it <container ID>  /bin/sh  (locate your jar file)

Ex: 3
    docker build -t  workshop .
    docker run -p 8082:8082 --env SERVER_PORT=8082 -d workshop    
    Open in broswer and Enter : http://localhost:8082/workshop
you should see Welcome message



Ex: 4
    docker build -t  workshop .
    docker run -p 8082:8082 --env SERVER_PORT=8082  --env UPLOAD_DIR=/tmp/fileupload -v /home/fileupload:/tmp/  -d workshop    



FOR upload the endpoint is   


curl --location 'http://localhost:8082/upload' --form 'file=@"/C:/Users/NMR020/Downloads/Dockerfile.txt"'

Check output in your host system using  **ls /home/fileupload   **

![image](https://github.com/user-attachments/assets/b6f9f234-3874-4046-bd40-3918e1f822a0)



K8S Excerices:  

Reference: https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Ingress

minikube start

kubectl get po -A

minikube dashboard


Open New terminal

Ex: 5  Create Hello minikube service in Kubernetes 
Sol:
  kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl port-forward service/hello-minikube 7080:8080

Your application is now available at http://localhost:7080/

Ex 6:  Create  Hello minikube  with  Load balancer
Sol:
kubectl create deployment balanced --image=kicbase/echo-server:1.0
kubectl expose deployment balanced --type=LoadBalancer --port=8080

minikube tunnel

To find the routable IP, run this command and examine the EXTERNAL-IP column:
kubectl get services balanced

Your deployment is now available at <EXTERNAL-IP>:8080  (without port forwarding)


Ex:7  Create  Hello minikube with Ingress controller
Sol: 
minikube addons enable ingress

kubectl apply -f https://storage.googleapis.com/minikube-site-examples/ingress-example.yaml

TO get ingress details
kubectl get ingress
NAME              CLASS   HOSTS   ADDRESS          PORTS   AGE
example-ingress   nginx   *       <your_ip_here>   80      5m45s

To get output:

curl <ip_from_above>/foo


