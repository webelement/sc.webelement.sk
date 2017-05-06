#!/bin/bash

docker-compose build app \
  && docker-compose run --rm app nginx -t \
  && docker run -i -t --rm \
  -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  quay.io/rekurzia/aws-cli-docker ecr get-login --region eu-central-1 | tr -d "\r\n" | sh \
  && docker tag webelement/webelement-slides 297411564328.dkr.ecr.eu-central-1.amazonaws.com/webelement/slides:latest \
  && docker push 297411564328.dkr.ecr.eu-central-1.amazonaws.com/webelement/slides:latest
