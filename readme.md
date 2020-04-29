
### To build base Image
```
docker build -t ngxtech/ubuntu1804:dind .
docker login
docker push 
```
### To build the Docker image
```
docker build . -t ununtu1804-dind-test
docker run -d  \
 --name ubuntu1804-dind-test \
 --privileged=true \
 ngxtech/ubuntu1804:dind
 ```
### Attach to the docker shell and run the following command
```
wrapdocker
docker ps
docker run nginx -d
```
