FROM nvidia/cuda:11.6.1-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive 


RUN apt update && apt install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && apt-get update && apt-get install -y python3.9 python3-pip python3.9-distutils sudo 
RUN useradd -m konakona

RUN chown -R konakona:konakona /home/konakona

COPY --chown=konakona:konakona . /home/konakona/src

USER konakona
RUN cd /home/konakona/src \
    && python3.9 -m pip install --upgrade pip \
    && python3.9 -m pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 scipy numpy kornia scikit-image matplotlib torchsummary tensorboard

WORKDIR /home/konakona/src