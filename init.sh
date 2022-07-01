#! /bin/bash

mkdir project-files
echo "Waiting for project uploading..."
while [ -z $(ls project-files/) ]; do
  sleep 1
done

echo "Project uploaded"
cd ./project-files

go mod download

GOOS=linux CGO_ENABLED=0 go build -o goapp .
./goapp
