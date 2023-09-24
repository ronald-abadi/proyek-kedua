FROM node:14.21-alpine as builder

# Tambahkan beberapa label sekedar informasi saja
LABEL applikasi="karsajobs-ui"
LABEL maintainer="Ronald Mulyono Abadi"
LABEL version="1.0"
LABEL description="DBS Foundation Coding Camp 2023, Learning Path \
DevOps Engineer, Kelas Expert, Belajar Membangun Arsitektur Microservices, \
Submission Proyek Kedua: Proyek Deploy Aplikasi Karsa Jobs dengan Kubernetes"

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 8000
CMD [ "npm", "run", "serve" ]
