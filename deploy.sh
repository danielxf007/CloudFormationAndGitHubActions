#!/bin/bash
DIRNAME=$PWD

create_bucket() {

  STACK_NAME=bucket-deployment
  echo "Creating Stack ..."
  echo $(aws cloudformation deploy --stack-name "$STACK_NAME" \
        --template-file "$DIRNAME"/templates/bucket.yaml \
        --parameter-overrides \
          bucketName="$AWS_BUCKET" \
        --capabilities "CAPABILITY_NAMED_IAM" \
        --region "$AWS_REGION"
        )
  echo "Deployed Bucket"
}

create_lambda() {

  STACK_NAME=lambda-deployment
  echo "Creating Stack ..."
  echo $(aws cloudformation deploy --stack-name "$STACK_NAME" \
        --template-file "$DIRNAME"/templates/lambda.yaml \
        --capabilities "CAPABILITY_NAMED_IAM" \
        --region "$AWS_REGION"
        )
  echo "Deployed Lambda"
}

subcommand=$1

case "$subcommand" in
    create-bucket) create_bucket "$@"; exit;;
    create-lambda) create_lambda "$@"; exit;;
    *) echo "Unimplemented command: $subcommand" >&2; exit 1;;
esac