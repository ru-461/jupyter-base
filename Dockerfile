FROM python:3.10

WORKDIR /app/work/

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /root

RUN pip install --upgrade pip \
  && pip install --no-cache-dir jupyterlab \
  jupyterlab-language-pack-ja-JP \
  black \
  isort \
  jupyterlab-code-formatter

RUN mkdir $HOME/.jupyter
COPY ./.jupyter/jupyter_notebook_config.py $HOME/.jupyter/
