#!/bin/sh

echo "start"
sourcecode=$(cat ./test/zcl_handler.clas.abap)
event='{"event":"eventdata"}'
response=$(sourcecode=$sourcecode event=$event _HANDLER='zcl_handler.clas.abap' node ./test/runtime.js)
echo $response
echo "ende"
