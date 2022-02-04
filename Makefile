all:
	docker buildx build --platform linux/arm64,linux/amd64 --tag jsalort/texlive:2021 --push .
	docker tag jsalort/texlive:2021 jsalort/texlive:latest

push:
	docker push jsalort/texlive:2021
	docker push jsalort/texlive:latest