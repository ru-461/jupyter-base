FROM python:3.10

WORKDIR /app/work/

RUN apt-get update -y \
  && apt-get upgrade -y

RUN pip install --upgrade pip

RUN pip install jupyterlab \
  jupyterlab-language-pack-ja-JP \
  black \
  isort \
  jupyterlab-code-formatter \
  && rm -rf ~/.cache/pip
