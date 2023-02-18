# SageSetup


## Setup 

```bash
docker build -t sage_docker .
docker run -it -v "${PWD}:/home/SageMaster/share" sage_docker
```
