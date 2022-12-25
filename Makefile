all:
	bash ./srcs/setup.sh
	docker-compose -f ./srcs/docker-compose.yml up -d
build:
	bash ./srcs/setup.sh
	docker-compose -f ./srcs/docker-compose.yml up --build -d
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker system prune -a
	@rm -rf /tmp/data

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf /tmp/data

re: fclean all