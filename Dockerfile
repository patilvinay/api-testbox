# Creates api text box
FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y tar cmake make git ssh wget openssh-server curl sudo
#WORKDIR /home
RUN mkdir /root/.ssh
RUN ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts
RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts
RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN apt-get install -y apt-transport-https ca-certificates software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN apt-get install --yes nodejs mocha chai
RUN curl -L --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/2.4.0/yq_linux_amd64
RUN chmod u=xrw /usr/local/bin/yq
RUN apt-get install -y python3-pip jq
RUN apt-add-repository --yes  ppa:ansible/ansible
RUN apt-get install -q -y ansible 
# Install Docker
RUN apt-get install -y docker-ce
#RUN docker login registry.gitlab.com
#RUN docker login -u ${USERNAME} -p ${PASSWORD} registry.gitlab.com
#COPY docker-compose.yml .
#RUN  apt-get update
#RUN docker-compose up
#WORKDIR /home
#CMD ["/bin/bash", "-c", "while true; do sleep 30; done;"]