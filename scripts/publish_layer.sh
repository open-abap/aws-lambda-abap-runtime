#!/bin/sh

aws lambda publish-layer-version --layer-name abap-runtime --compatible-runtimes provided  --zip-file fileb://layer.zip