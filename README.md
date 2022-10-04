# Using Docker in High Performance Computing Applications

## Description

This project provides a series of DockerFiles built specifically for performing Hands On practices with openMP and openMPI. All practice itineraries are available by clicking [here](https://github.com/muriloboratto/hands-on-supercomputing-with-parallel-computing). 


## How to use Docker Container from Dockerfile, to reproduce an Hands On experimentation:

1. Inside the Dockerfile file directory, build the Docker image with:

```docker build -t hands-on-<number>-<distro>:latest .```

2. Now, run the following commands to run Dockerfile image:

```sudo docker create -t -i --name <name> -p 4000:4000 hands-on-<number>-<distro> ```

```sudo docker start <name>```

```sudo docker exec -it <name> bash```

3. Inside Docker Container, start jupyternotebook with:

```jupyter notebook --ip 0.0.0.0 --port 4000 --allow-root```

After that, open the created link in the browser, then just follow the instructions written in .ipynb file!

