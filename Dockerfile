#Sistema Operacional
FROM python:3.9.14-slim-bullseye

#Developer
LABEL maintainer "Matheus Ferreira <matheus.santo@lps.ufrj.br>"

#Usuário
USER root

#Variáveis
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM screen

#Dependências do sistema
RUN apt-get update -y

#Diretório do usuário docker
RUN mkdir /kernel-env
WORKDIR /kernel-env

#Pacotes do Python
COPY classes/ /kernel-env/
COPY data/ /kernel-env/
COPY notebooks/ /kernel-env/
COPY README.md /kernel-env/
COPY requirements.txt /kernel-env/

#Atualização do gerenciador de pacotes
RUN pip install --upgrade pip

#Instalação dos pacotes listados
RUN pip install -r requirements.txt
