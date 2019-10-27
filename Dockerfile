FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install python python-pip -y
RUN mkdir /opt/app/
COPY src/main.py /opt/app
COPY requirements.txt /opt/app
RUN pip install virtualenv
RUN pip install source
RUN pip install --upgrade pip
RUN pip install Flask
RUN pip install -r requirements.txt
COPY docker-entrypoint.sh /
ENTRYPOINT "/docker-entrypoint.sh"
