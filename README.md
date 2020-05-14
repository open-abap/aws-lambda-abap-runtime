# aws-lambda-abap-runtime
AWS Lambda ABAP custom runtime

# Usage

Add a Node.js layer from this repository https://github.com/lambci/node-custom-lambda to the lambda function. 

## Upload runtime with AWS CLI


Run this commands to create the abap runtime layer as zip file.

```sh
npm install
sh /scripts/create_layer.sh
```

Add this layer as second layer to the lambda function. Via manual Upload or with the command from /scripts/publich_layer.sh. 

## Upload runtime with AWS SAM

Run this commands to create and deploy the abap runtime layer.

```sh
npm install
sh /scripts/create_layer.sh
sam build
sam deploy
```

## AWS lambda

Create a file with the name `zcl_handler.clas.abap` in the lambda function. It could looks like the the file in the test folder.