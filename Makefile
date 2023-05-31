all:
	# Default is x86_64 because that is what we use on the VPS
	docker build --platform x86_64 -t jsalort/texlive:2023_intel .
	docker tag jsalort/texlive:2023_intel jsalort/texlive:latest

push:
	# We only push the x86_64 because we never pull the arm64
	docker tag jsalort/texlive:2023_intel jsalort/texlive:2023
	docker tag jsalort/texlive:2023_intel jsalort/texlive:latest
	docker push jsalort/texlive:2023
	docker push jsalort/texlive:latest

arm:
	# Building arm64 locally
	docker build --platform arm64 -t jsalort/texlive:2023_arm64 .
	docker tag jsalort/texlive:2023_arm64 jsalort/texlive:latest

push_arm:
	# If we eventually want to push the arm64
	docker push jsalort/texlive:2023_arm64

universal:
	# TODO
	docker buildx build --platform linux/arm64,linux/amd64 --tag jsalort/texlive:2023 --push .
