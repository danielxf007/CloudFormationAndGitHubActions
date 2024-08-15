#!/bin/bash
DIRNAME=$PWD

create_bucket() {

  STACK_NAME=bucket-deployment
  if ! $(aws cloudformation describe-stacks --stack-name "$STACK_NAME"); then
    echo "Stack does not exsit"
    echo "Creating Stack ..."
    echo $(aws cloudformation deploy --stack-name "$STACK_NAME" \
          --template-file "$DIRNAME"/templates/bucket.yaml \
          --parameter-overrides \
            bucketName="$AWS_BUCKET" \
          --capabilities "CAPABILITY_NAMED_IAM" \
          --region "$AWS_REGION"
          )

  fi
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