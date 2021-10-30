# The Alpine Docker image with latest GCC

This image is based on Alpine Linux image and contains [C/C++ compiler](https://gcc.gnu.org/) (GCC 11).

## Docker Hub images

```
$ docker pull boeboe/alpine-gcc:3.14-11.2.0
or
$ docker pull boeboe/alpine-gcc:3.13-11.1.0
or
$ docker pull boeboe/alpine-gcc:3.12-11.2.0
or
$ docker pull boeboe/alpine-gcc:3.11-11.1.0

```

## Build image

```
$ make
help                           This help
build                          Build the container
publish                        Tag and publish container
release                        Make a full release 
```
