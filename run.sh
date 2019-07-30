#!/usr/bin/env bash

docker build -t sartest .
docker run -v $PWD:/workdir -it sartest 
