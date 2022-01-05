# singularity-docker

Singularity can be run in a docker using privileged mode.

## Build

```
docker build . -t singularity-docker:latest
```

## Run

```
docker run singularity-docker run docker://centos:7 cat /etc/redhat-release
```

will run singularity out of a CentOS 8 based container. Singularity within that container will run CentOS 7.  
