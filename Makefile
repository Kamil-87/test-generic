.DEFAULT_GOAL := initProject
CWD := $(shell pwd)
NETWORK := $(shell basename `pwd`)_default

initProject: db back front dashboard docker

db:
	@sudo chmod +x ./initdb.sh && ./initdb.sh

back:
	@git clone git@gitlab.com:icwt/mevn-back.git

dashboard:
	@git clone git@gitlab.com:icwt/mevn-dashboard.git

front:
	@git clone git@gitlab.com:icwt/mevn-front.git

docker:
	@docker-compose up -d

docker-reset:
	@dcoker-compose down
	@docker volume prune -f
	@docker-compose build
	@echo 'Project has been reset'

docker-stop:
	@docker-compose down
