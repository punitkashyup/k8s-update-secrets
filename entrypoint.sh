#!/bin/sh -l

# Load environment variables from secrets
export NAMESPACE=$1
export SECRET_NAME=$2
export KEY=$3
export NEW_VALUE=$4

# Run the Node.js script
node index.js
