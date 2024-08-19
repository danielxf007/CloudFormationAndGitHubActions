#!/bin/bash
DIRNAME=$PWD

create_bucket() {

  STACK_NAME=bucket-deployment
  if ! $(aws cloudformation describe-stacks --stack-name "$STACK_NAME"); then
    echo "Stack does not exist ..."
    echo "Creating Stack ..."
    echo $(aws cloudformation deploy --stack-name "$STACK_NAME" \
          --template-file "$DIRNAME"/templates/bucket.yaml \
          --parameter-overrides \
            bucketName="$AWS_BUCKET" \
          --capabilities "CAPABILITY_NAMED_IAM" \
          --region "$AWS_REGION"
          )
    echo "Deployed Bucket"
  else
    echo "$STACK_NAME Stack exists"
  fi
  
}

create_lambda() {

  STACK_NAME=lambda-deployment
  if ! $(aws cloudformation describe-stacks --stack-name "$STACK_NAME"); then
    echo "Stack does not exist ..."
    echo "Creating Stack ..."
    echo $(aws cloudformation deploy --stack-name "$STACK_NAME" \
          --template-file "$DIRNAME"/templates/lambda.yaml \
          --parameter-overrides \
          --capabilities "CAPABILITY_NAMED_IAM" \
          --region "$AWS_REGION"
          )
    echo "Deployed Lambda"
  else
    echo "$STACK_NAME Stack exists"
  fi
}

subcommand=$1

case "$subcommand" in
    create-bucket) create_bucket "$@"; exit;;
    create-lambda) create_lambda "$@"; exit;;
    *) echo "Unimplemented command: $subcommand" >&2; exit 1;;
esac