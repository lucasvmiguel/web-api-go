docker_repository = lucasvieira
version_build = $$(date +%s)
project_name = web-api-go

test:
	go test -cover -race $(go list ./... | grep -v /vendor/)

build: test
	sudo docker build -t $(docker_repository)/$(project_name):$(version_build) .
	@echo version of build: $(version_build)

publish-docker: test
	sudo docker login -u=$(docker_repository) -p=$(docker_password)
	sudo docker push $(docker_repository)/$(project_name)

pull-docker:
	sudo docker login -u=$(docker_repository) -p=$(docker_password)
	sudo docker pull $(docker_repository)/$(project_name)

run:
	sudo docker run -d -p 8080:8080 lucasvieira/web-api-go:$(version)