FROM node:12

COPY ./import.sh /scripts/import.sh

RUN npm install -g dtd2mysql

WORKDIR /data

CMD /scripts/import.sh
