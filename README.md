# Using Docker in High Performance Computing Applications

## Description

This project provides a series of DockerFiles built specifically for performing Hands On practices with openMP and openMPI. All practice itineraries are available by clicking [here](https://github.com/muriloboratto/hands-on-supercomputing-with-parallel-computing). 


## How to use Docker Container from Dockerfile, to reproduce an Hands On experimentation:

1. Inside the Dockerfile file directory, build the Docker image with:

```docker build -t hands-on-<number>-<distro>:latest .```


Here is an example of a possible command, as i try to build ubuntu hands-on-1 image:

```docker build -t hands-on-1-ubuntu:latest .```

2. Now, run the following commands to run Dockerfile image:

```sudo docker create -t -i --name <name> -p 4000:4000 hands-on-<number>-<distro> ```

```sudo docker start <name>```

```sudo docker exec -it <name> bash```

Here is an example of a possible command, as i try to run ubuntu hands-on-1 image:

```sudo docker create -t -i --name hands-on-1-_08_10_2022 -p 4000:4000 hands-on-1-ubuntu ```

```sudo docker start hands-on-1-_08_10_2022```

```sudo docker exec -it hands-on-1-_08_10_2022 bash```


3. Inside Docker Container, start jupyternotebook with:

```jupyter notebook --ip 0.0.0.0 --port 4000 --allow-root <ipynb_namefile>```

Here is an example of a possible command, as i try to run hands-on-1 .ipynb file:

```jupyter notebook --ip 0.0.0.0 --port 4000 --allow-root Relatorio-Pratica-HandsOn-1.ipynb```

After that, open the created link in the browser, then just follow the instructions written in .ipynb file!

