FROM python:3.10

RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV HOME /root

COPY requirements.txt .

RUN pip install --upgrade pip \
  && pip install --no-cache-dir -r requirements.txt \
  && rm -rf ~/.cache/pip

RUN mkdir $HOME/.jupyter
COPY ./.jupyter $HOME/.jupyter/

WORKDIR /app/works/
