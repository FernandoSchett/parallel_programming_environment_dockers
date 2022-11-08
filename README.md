# Using Docker in High Performance Computing Applications

## Description

This project provides a series of DockerFiles built specifically for performing Hands On practices with openMP and openMPI. All practice itineraries are available by clicking [here](https://github.com/muriloboratto/hands-on-supercomputing-with-parallel-computing). 


## How to use Docker Container from Dockerfile, to reproduce an Hands On experimentation:

1. Inside the Dockerfile file directory, build the Docker image with:

```docker build -t hands-on-1-ubuntu:latest .```

2. Now, run the following commands to run Dockerfile image:

```docker run -p 4000:4000 -it hands-on-1-ubuntu```

3. After that, open the created link in the browser, then just follow the instructions written in .ipynb file!

