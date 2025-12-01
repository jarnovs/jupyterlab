FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y python3 python3-pip python3-venv
RUN python3 -m venv /root/.venv

ENV PATH="/root/.venv/bin:${PATH}"
RUN pip install --no-cache-dir jupyterlab notebook
RUN jupyter notebook --generate-config

WORKDIR /root/.jupyter
COPY jupyter_notebook_config.py jupyter_notebook_config.py

RUN mkdir /anaconda && cd /anaconda
WORKDIR /anaconda

CMD ["jupyter","lab"]
