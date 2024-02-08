FROM sagemath/sagemath

ENV USER SageMaster

RUN sudo apt-get clean && \
	sudo apt-get update --fix-missing &&\
	sudo apt-get -y --yes upgrade

RUN sudo apt-get -y -qq install --yes sudo bash nano socat netcat wget iproute2 curl 

RUN /home/sage/sage/local/var/lib/sage/venv-python3.11.1/bin/python3 -m pip install --upgrade pip && \
	/home/sage/sage/local/var/lib/sage/venv-python3.11.1/bin/python3 -m pip install pwntools pycryptodome z3-solver

RUN \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" && \
    echo "zsh" >> /home/sage/.bashrc && \
    echo "cd /home/${USER}/sage" >> /home/sage/.zshrc


CMD ["/bin/bash"]
