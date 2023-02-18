### Dockerfile ###
FROM python:3.10.4-slim-bullseye

ENV DEBIAN_FRONTEND=noninteractive
ENV USER SageMaster
ENV WORK /home/${USER}/sage
ENV SHELL /bin/bash 
##################

###### Deps ######
RUN apt-get update
RUN apt-get -y -qq install --yes sudo bash nano wget curl sagemath sagemath-doc-en sagemath-jupyter
RUN pip install --upgrade pip
RUN python3 -m pip install pwntools
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
