setup:
	@mkdir -p /home/yachehbo/data
	@mkdir -p /home/yachehbo/data/mariadb
	@mkdir -p /home/yachehbo/data/wordpress

up: setup
	docker-compose -f ./srcs/docker-compose.yml up -d

build: setup
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker rmi -f $$(docker images -qa)

fclean:
	@docker volume rm $$(docker volume ls -q)
	@rm -rf /home/yachehbo/data
	@docker network rm $$(docker network ls -q)

re: fclean all