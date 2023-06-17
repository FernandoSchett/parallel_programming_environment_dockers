<h1 align="center">🐋 Using Docker in High Performance Computing Applications 🐋</h1>

<div align="center">
	<a href="link_for_webite">
	<img height = "250em" src = "https://github.com/FernandoSchett/parallel_programming_environment_dockers/assets/80331486/b1d1cff1-a310-423b-b24c-705e1b8a94b7" />
    </a>
</div>

## Developed by 💻:
- [Fernando Schettin](https://github.com/FernandoSchett).

## Special thanks to 🥰:
- [Murilo Boratto](https://github.com/muriloboratto), your experience and knowledge have been invaluable to our progress.

## About 🤔:

This project provides a series of Dockerfiles specifically designed for parallel dev, hands-on practices with openMP, openMPI, CUDA, NCCL and libraries. It aims to offer an easy-to-use environment for students who are new to parallel computing. The practice itineraries can be found [here](https://github.com/muriloboratto/hands-on-supercomputing-with-parallel-computing).

By utilizing [Docker](https://www.docker.com/), this project enables the effortless reproduction of experiments conducted in another repository. With this approach, it becomes simple and convenient to replicate those experiments, fostering an accessible learning experience.

If you're interested in exploring parallel computing and want to dive into hands-on exercises, this repository serves as an excellent starting point. It provides a collection of Dockerfiles that facilitate the setup of experimentation environments parallel code frameworks.

If you new at [Docker](https://www.docker.com/), check it out this [repository](https://github.com/orlandomotapires/docker_kick_start). Let's embark on an exciting journey into the world of parallel computing!

## Resourses 🧑‍🔬:    

- Dockerfiles: A series of Dockerfiles configurations tailored to create reproducible environments for the hands-on exercises. These Dockerfiles ensure an easy and practical setup process for executing the practices.

- Code samples: A variety of code examples written in languages such as C, C++, or other relevant languages for parallel computing. These samples serve as references and starting points for understanding and implementing parallel algorithms and techniques.

- Supporting materials: Supplementary files, documents, or resources that complement the practice itineraries and provide additional insights into parallel computing concepts, best practices, or related topics.

- Easy usability, Accessibility and Practicality: The project focuses on providing a user-friendly experience, particularly for students who are new to parallel computing. The [Docker](https://www.docker.com/)-based approach simplifies the reproduction of experiments conducted in another repository, ensuring a straightforward and convenient replication process.

## Dependencies 🚚:

The project dependencies are described in a dependencies file within the repository. In summary, heres what you're gonna need in order to run the project:

- jupyter, 6.5.2.
- docker, 4.20.1.

For installing dependencies more quickly, you can run the following command at terminal, inside the clonned repository:

    pip3 install -r ./dependencies/requirements.txt

Make sure you have all Dependencies before running the project.

## How to use Docker Container from Dockerfile, to reproduce an Hands On experimentation 🏃:

1. First, clone this repository. After that, inside the [Docker](https://www.docker.com/)file file directory, build the [Docker](https://www.docker.com/) image with:

        docker build -t hands-on-1-ubuntu:latest .

2. Now, run the following commands to run Dockerfile image:

        docker run -p 4000:4000 -it hands-on-1-ubuntu

3. After that, open the created link in the browser, then just follow the instructions written in .ipynb file!

## Screens 🎬:

Here it is an example of a [Docker](https://www.docker.com/) virtual ambient, when executed:

<div align="center">
	<a href="">
	<img height = "250em" src = "" />
    </a>
</div>
<h4 align="center">Figure 1 - Screens from a running docker virtual ambient.</h4>

## Development Process ⚙️:

I met with my internship advisor once a week to showcase progress and receive guidance. I researched and selected [Docker](https://www.docker.com/) for reproducibility. I designed practice itineraries with theoretical concepts and practical exercises. Dockerfiles were created to streamline environment setup. Regular meetings with my advisor ensured project quality and improved my understanding of parallel computing. The project represents a collaborative effort resulting in an accessible learning resource.

### Tools Used 🛠️: 

- [Jupyter Notebook](https://jupyter.org/). 
- [Docker](https://www.docker.com/).
- [VScode](https://code.visualstudio.com/).

## How to contribute 🫂:

Feel free to create a new branch, fork the project, create a new Issue or make a pull request contact one of us to develop at this repository.

## Licence 📜:

[Apache V2](https://choosealicense.com/licenses/apache-2.0/).

