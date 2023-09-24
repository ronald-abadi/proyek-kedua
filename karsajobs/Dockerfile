FROM golang:1.15-alpine

# Tambahkan beberapa label sekedar informasi saja
LABEL applikasi="karsajobs"
LABEL maintainer="Ronald Mulyono Abadi"
LABEL version="1.0"
LABEL description="DBS Foundation Coding Camp 2023, Learning Path \
DevOps Engineer, Kelas Expert, Belajar Membangun Arsitektur Microservices, \
Submission Proyek Kedua: Proyek Deploy Aplikasi Karsa Jobs dengan Kubernetes"

WORKDIR /go/src/github.com/dicodingacademy/karsajobs
ENV GO111MODULE=on
ENV APP_PORT=8080

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .
RUN mkdir /build; \
    go build -o /build/ ./...

EXPOSE 8080
CMD ["/build/web"]
