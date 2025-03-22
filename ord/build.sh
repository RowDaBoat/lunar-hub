#!/bin/bash

git clone https://github.com/ordinals/ord.git ord-src
cp Dockerfile-patch ord-src/Dockerfile
cd ord-src
docker build -t ordinals/ord .

