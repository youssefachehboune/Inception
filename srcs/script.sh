# !/bin/bash

sudo rm -rf /home/yachehbo/data/*
sudo mkdir -p /home/yachehbo/data/db /home/yachehbo/data/wordpress
sudo docker rmi -f $(docker images -a -q)
sudo docker rm -f $(docker ps -a -q)
