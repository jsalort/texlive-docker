all:
	docker build -t jsalort/texlive:2021 .

push:
	docker push jsalort/texlive:2021