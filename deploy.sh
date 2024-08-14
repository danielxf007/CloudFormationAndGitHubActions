#!/bin/bash

create_bucket() {

  STACK_NAME=bucker-deployment
  REGION="us-east-1"

  echo $STACK_NAME
  echo $AWS_REGION
  echo "Deployed Bucket"
}

create_lambda() {
  echo "Deployed Lambda"
}

deploy_lambda_code() {
    echo "Deployed Lambda Code"
}
subcommand=$1

case "$subcommand" in
    create-bucket) create_bucket "$@"; exit;;
    create-lambda) create_lambda "$@"; exit;;
    deploy-lambda-code) deploy_lambda_code "$@"; exit;;
    *) echo "Unimplemented command: $subcommand" >&2; exit 1;;
esac