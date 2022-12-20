#!/bim/bash

rm -rf /tmp/data
docker rmi -f $(docker images -a -q)
docker rm -f $(docker ps -aq)
docker volume rm $(docker volume ls -q)
