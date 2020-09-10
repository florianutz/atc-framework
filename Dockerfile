FROM ubuntu:latest
ENV atc_path /srv/atomic-threat-coverage
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y git python3 python3-pip make gettext rsync
#RUN apk add --no-cache git python3 make gettext rsync
RUN git clone https://github.com/atc-project/atomic-threat-coverage.git $atc_path
RUN cd $atc_path && pip3 install --upgrade pip && pip3 install -r requirements.txt && make setup_repo && make clean
