up:
	docker build -t my-websites-dock --pull .
	docker run -d -p 443:443 --name my-websites-dock my-websites-dock
down:
	docker stop my-websites-dock
	docker rm my-websites-dock

