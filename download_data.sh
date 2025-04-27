#!/bin/bash

zipfile=https://maven-datasets.s3.amazonaws.com/CRM+Sales+Opportunities/CRM+Sales+Opportunities.zip

mkdir ./input
cd ./input
curl -L $zipfile -o ./input.zip
unzip ./input.zip
rm ./input.zip
cd ..

docker compose up -d
