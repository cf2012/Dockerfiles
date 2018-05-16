#!/bin/bash
registry=$1
name=finderweb
tag=$2

# 在当前目录下 build
docker build -t ${registry}/${name}:${tag}  .

# 打tag, latest
docker tag ${registry}/${name}:${tag}   ${registry}/${name}:latest

# 推送
docker push ${registry}/${name}:${tag}
docker push ${registry}/${name}:latest
