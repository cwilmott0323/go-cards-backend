FROM golang:latest

RUN mkdir /app

COPY db_api /app/db_api
COPY * /app/

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/db_api"]
