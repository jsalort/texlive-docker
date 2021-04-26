# texlive-docker

This is my personal full TeXLive docker file for use with Gitlab Runner.
It is based on Ubuntu 20.04 image and is used as the basis for the python docker file,
which has both texlive and python available.

This docker file can be used to automate LaTeX compilation on Gitlab servers.
Exemple: [DemoLaTeX on Framagit](https://framagit.org/jsalort/demolatex).

This dockerfile is published on [Docker Hub](https://hub.docker.com/repository/docker/jsalort/texlive),
but I do not set up automatic build.

To use it locally:
```bash
$ docker pull jsalort/texlive:latest
$ docker run -it jsalort/texlive:latest bash
```

It can be built from source using the provided `Makefile`:
```bash
$ make
```
