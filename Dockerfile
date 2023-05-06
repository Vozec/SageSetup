### Dockerfile ###
# FROM python:3.10.4-slim-bullseye
FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV USER SageMaster
ENV WORK /home/${USER}/sage
ENV SHELL /bin/bash 
##################

###### Deps ######
RUN rm -rf /var/lib/apt/lists/* ; apt-get clean;apt-get update --fix-missing;apt-get -y --yes upgrade
RUN apt-get -y -qq install --yes sudo bash nano socat netcat wget iproute2 curl 
RUN apt-get -y -qq install --yes sagemath sagemath-doc-en sagemath-jupyter

RUN python3.9 -m pip install --upgrade pip
RUN python3.9 -m pip install pwntools pycryptodome z3-solver
##################


##### Config ######
RUN useradd -m -s /bin/bash ${USER} ;\
	echo "${USER}:${USER}" | chpasswd ;\
	mkdir /home/${USER}/share ;\
	echo "cd /home/${USER}/share;zsh" >> /root/.bashrc ;\
	chown -R ${USER} /home/${USER}

RUN \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" ;\
    echo "cd /home/${USER}/share" >> /root/.zshrc
##################


WORKDIR ${WORK}
CMD ["/bin/bash"]
