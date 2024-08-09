def lambda_handler(event,context):
    print(event)
    print(context)
    print("Hello World From Lambda Function Updated")
    return "Finished"     