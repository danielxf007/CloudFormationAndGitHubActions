#!/bin/bash

create_bucket() {

  STACK_NAME=bucker-deployment
  DOMAIN_AWS_PROFILE="default"
  REGION=$(aws configure get region --profile "$DOMAIN_AWS_PROFILE")


  echo $STACK_NAME
  echo $DOMAIN_AWS_PROFILE
  echo $REGION
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