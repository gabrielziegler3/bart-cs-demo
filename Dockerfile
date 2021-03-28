# FROM ubuntu:20.04
FROM ubuntu:18.04

USER root

# Define working directory.
WORKDIR /bart

COPY . /bart

RUN apt-get update && apt-get -y install make python3.8 git gcc libfftw3-dev \
        liblapacke-dev libpng-dev python3-distutils \
        libopenblas-dev vim wget curl

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.8 get-pip.py

RUN pip install -r requirements.txt

# Install FastMRI
RUN git clone https://github.com/facebookresearch/fastMRI.git
RUN cd fastMRI && pip install -e . && cd ~

# Install BART 
RUN wget https://github.com/mrirecon/bart/archive/refs/tags/v0.7.00.tar.gz
RUN tar xzf v0.7.00.tar.gz
RUN cd bart-0.7.00 && make && make install && cd ~

ENV TOOLBOX_PATH=$(which bart)
ENV PATH=$TOOLBOX_PATH:$PATH
ENV PYTHONPATH="${TOOLBOX_PATH}/python:$PYTHONPATH"
