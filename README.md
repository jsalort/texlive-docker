# texlive2020-docker

This is my personal full TeXLive 2020 docker file for use with Gitlab Runner.
I use it as the basis for the py38 docker file, which has both texlive and anaconda.

This docker file can be used to automate LaTeX compilation on Gitlab servers.
Exemple: [DemoLaTeX on Framagit](https://framagit.org/jsalort/demolatex).

This dockerfile is published on [Docker Hub](https://hub.docker.com/repository/docker/jsalort/texlive2020).

To use it locally:
```bash
$ docker pull jsalort/texlive2020:latest
$ docker run -it jsalort/texlive2020:latest bash
```

It can be built from source using the provided `Makefile`:
```bash
$ make
```
