# SageSetup


## Setup 

*sage.sh*
```bash
id="$(docker container ls -a -f "ancestor=sage_docker" -q | head -n1)"
if [ "$id" != "" ];
then
	docker start "$id";docker exec -it "$id" bash
else
	docker run -it -v "${PWD}:/home/SageMaster/share" -P sage_docker
fi
```
