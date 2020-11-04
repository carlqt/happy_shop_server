prepare:
	docker exec -it bundle exec rails db:migrate && bundle exec rails db:seed

build:
	docker build -t happy_shop_server .

start:
	docker run --publish 8000:8000 -v ${PWD}:/app --name server happy_shop_server

start_no_mount:
	docker run --publish 8000:8000 --name server happy_shop_server

console:
	docker exec -it server bundle exec rails c
