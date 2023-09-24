#!/bin/bash
# Ronald Mulyono Abadi
# DBS Foundation Coding Camp 2023, Learning Path DevOps Engineer
# Kelas Expert, Belajar Membangun Arsitektur Microservices
# Submission Proyek Kedua: Proyek Deploy Aplikasi Karsa Jobs dengan Kubernetes
# File: run.sh
# Tujuan: Untuk membantu menjalankan Kubernetes

printf "Hapus dulu semua sekiranya diperlukan...\n"
kubectl delete -f frontend/karsajobs-ui-deployment.yml \
  -f frontend/karsajobs-ui-service.yml \
  --force --grace-period=0 &> /dev/null
  
kubectl delete -f backend/karsajobs-deployment.yml \
  -f backend/karsajobs-service.yml \
  --force --grace-period=0 &> /dev/null 

kubectl delete -f mongodb/mongo-configmap.yml \
  -f mongodb/mongo-secret.yml \
  -f mongodb/mongo-pv-pvc.yml \
  -f mongodb/mongo-statefulset.yml \
  -f mongodb/mongo-service.yml \
  --force --grace-period=0 &> /dev/null
  
printf "\nTunggu beberapa saat...\n"
sleep 1m  

printf "\nBuat Kubernetes objects untuk MongoDB...\n"
kubectl apply -f mongodb/mongo-configmap.yml \
  -f mongodb/mongo-secret.yml \
  -f mongodb/mongo-pv-pvc.yml \
  -f mongodb/mongo-statefulset.yml \
  -f mongodb/mongo-service.yml

printf "\nTunggu beberapa saat...\n"
sleep 1m  
  
printf "\nDaftar ConfigMaps saat ini:\n"  
kubectl get configmaps -o wide

printf "\nDaftar Secrets saat ini:\n"  
kubectl get secrets -o wide

printf "\nDaftar PV saat ini:\n"  
kubectl get pv -o wide

printf "\nDaftar PVC saat ini:\n"  
kubectl get pvc -o wide

printf "\nDaftar StatefulSets saat ini:\n"  
kubectl get statefulsets -o wide

printf "\nDaftar Services saat ini:\n"  
kubectl get services -o wide

printf "\nDaftar Pods saat ini:\n"  
kubectl get pods -o wide

printf "\nBuat Kubernetes objects untuk Backend...\n"
kubectl apply -f backend/karsajobs-deployment.yml \
  -f backend/karsajobs-service.yml
  
printf "\nTunggu beberapa saat...\n"
sleep 1m  
  
printf "\nDaftar Deployments saat ini:\n"  
kubectl get deployments -o wide  

printf "\nDaftar Services saat ini:\n"  
kubectl get services -o wide

printf "\nDaftar Pods saat ini:\n"  
kubectl get pods -o wide

printf "\nBuat Kubernetes objects untuk Frontend...\n"
kubectl apply -f frontend/karsajobs-ui-deployment.yml \
  -f frontend/karsajobs-ui-service.yml
  
printf "\nTunggu beberapa saat...\n"
sleep 1m  
  
printf "\nDaftar Deployments saat ini:\n"  
kubectl get deployments -o wide  

printf "\nDaftar Services saat ini:\n"  
kubectl get services -o wide

printf "\nDaftar Pods saat ini:\n"  
kubectl get pods -o wide

printf "\nSelesai...\n"
