
### To build the Docker image
```
docker build . -t cloudbilling-api-testbox
```
### Working
```
docker run -d  \                                                                       ─╯
 --name loudbilling-api-testbox \
  --mount type=bind,source="/home/vagrant/d2/.ssh",target=/.ssh \
  -v /var/run/docker.sock:/var/run/docker.sock \
   --privileged=true \
  cloudbilling-api-testbox:latest
```

### works 2 mount point(docker ps works in side docker,this uses host machine deamon)
```
docker run -d  \
 --name loudbilling-api-testbox \
 --mount type=bind,source="/home/vagrant/d2/.ssh",target=/root/.ssh,readonly \
 --mount type=bind,source="/home/vagrant/.docker/",target=/root/.docker,bind-propagation=rslave \
 -v /var/run/docker.sock:/var/run/docker.sock \
 --privileged=true \
 cloudbilling-api-testbox:latest

```
--mount type=bind,source="/home/.docker/",target=/home/.docker,bind-propagation=rslave \