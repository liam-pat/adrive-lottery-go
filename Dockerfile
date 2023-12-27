FROM golang:1.20-alpine
LABEL maintainer="Packie Pat"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o main .
CMD ["./main"]