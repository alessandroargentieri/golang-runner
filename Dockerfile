FROM golang:1.18.0
WORKDIR project-files
COPY ./init.sh ../
CMD ["../init.sh"]
