setup:
	@mkdir -p /home/yachehbo/data
	@mkdir -p /home/yachehbo/data/mariadb
	@mkdir -p /home/yachehbo/data/wordpress

all: setup
	docker-compose -f ./srcs/docker-compose.yml up

build: setup
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker system prune -a
	@rm -rf /home/yachehbo/data

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@rm -rf /home/yachehbo/data

re: fclean all