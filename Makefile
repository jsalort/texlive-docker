all:
	# Default is x86_64 because that is what we use on the VPS
	docker build --platform linux/amd64 -t jsalort/texlive:2024_intel .
	docker tag jsalort/texlive:2024_intel jsalort/texlive:latest

push:
	# We only push the x86_64 because we never pull the arm64
	docker tag jsalort/texlive:2024_intel jsalort/texlive:2024
	docker tag jsalort/texlive:2024_intel jsalort/texlive:latest
	docker push jsalort/texlive:2024
	docker push jsalort/texlive:latest

test_arm:
	docker run -it --rm -v ${CURDIR}:/home/liveuser/workdir -w /home/liveuser/workdir jsalort/texlive:2024_arm64 pdflatex hello.tex

test_intel:
	docker run -it --rm -v ${CURDIR}:/home/liveuser/workdir -w /home/liveuser/workdir jsalort/texlive:2024_intel pdflatex hello.tex

arm:
	# Building arm64 locally
	docker build --platform linux/arm64 -t jsalort/texlive:2024_arm64 .
	docker tag jsalort/texlive:2024_arm64 jsalort/texlive:latest

push_arm:
	# If we eventually want to push the arm64
	docker push jsalort/texlive:2024_arm64

universal:
	# TODO
	docker buildx build --platform linux/arm64,linux/amd64 --tag jsalort/texlive:2024 --push .
