FROM ubuntu:18.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

RUN apt-get --yes -qq update \
 && apt-get --yes -qq upgrade \
 && apt-get --yes -qq install \
                      g++ \
                      gcc \
                      gnuplot \
                      libblas-dev \
                      liblapack-dev \
                      libopenmpi-dev \
                      libomp-dev \
                      openmpi-bin \
                      python3-dev \
                      python3-pip \
                      vim   \
                      sudo

RUN pip3 install --upgrade pip 
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install scipy
RUN pip3 install jupyter && pip3 install jupyterlab && pip3 install notebook 
RUN apt-get --yes -qq clean && rm -rf /var/lib/apt/lists/

COPY samples/ /home/admin/hands-on-1/

WORKDIR /home/admin/hands-on-1

CMD [ "jupyter", "lab", "--ip", "0.0.0.0", "--port", "4000", "--allow-root", "Relatório_Prática_Hands_On_1_Fernando_Gabriel_Jadson.ipynb"]

RUN echo huhu