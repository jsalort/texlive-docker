all:
	docker build --platform x86_64 -t jsalort/texlive:2021 .
	docker tag jsalort/texlive:2021 jsalort/texlive:latest

push:
	docker push jsalort/texlive:2021
	docker push jsalort/texlive:latest
