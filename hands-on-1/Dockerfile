FROM alpine

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

MAINTAINER @fernandoSchett

USER root

RUN apk  update \
 && apk  upgrade \
 && apk add --no-cache g++ \
                      gcc \
                      gnuplot \
                      blas-dev \
                      lapack-dev \
                      openmpi-dev \
                      openmp \
                      openmpi \
                      freetype-dev\
                      libpng-dev \
                      python3-dev \
                      python3 \
                      py3-pip \
                      vim \
                      sudo \ 
                      bash   

COPY requirements.txt /requirements.txt 

RUN apk add --no-cache py3-setuptools
RUN pip3 install --upgrade pip
RUN pip3 install wheel
RUN pip3 install --verbose -r requirements.txt  
RUN pip3 install jupyter && pip3 install jupyterlab && pip3 install notebook 

COPY samples/ /home/admin/hands-on-1/

WORKDIR /home/admin/hands-on-1

CMD [ "/bin/bash" ]

