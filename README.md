# Using Docker in High Performance Computing Applications

## Description

This project provides a series of DockerFiles built specifically for performing Hands On practices with openMP, openMPI. All practice itineraries are available by clicking [here](https://github.com/muriloboratto/hands-on-supercomputing-with-parallel-computing). 

## Softwares

- Ubuntu 18.04
- g++ 
- gcc 
- gnuplot
- libblas-dev 
- liblapack-dev 
- libopenmpi-dev 
- libomp-dev 
- openmpi-bin 
- python3-dev 
- python3-pip 
- vim 
- sudo
- jupyter
- jupyterlab
- jupyternotebook
- numpy 1.18.5
- matplotlib 3.0.3
- scipy 1.4.1

## How to use Docker Container from Dockerfile, to reproduce an Hands On experimentation:

1. Inside the Dockerfile file directory, build the Docker image with:

```docker build -t hands-on-number-distro:latest .```

2. Inside the Dockerfile file directory, build the Docker image with:

```docker run -it hpc-environment-docker bash```
