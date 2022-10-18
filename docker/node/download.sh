#!/bin/bash

if [ -z $1 ];
then
  echo "ERROR: Please provide a service name..."
  echo "Example:"
  echo -e "\t$ ./download.sh your-service"
  exit 1
fi

TMP="$PWD/$RANDOM"
SERVICE_PLACEHOLDER="###_SERVICE_NAME_###"

echo "[ $(date +%T) ] Cloning gist (via https) to temp directory..."
git clone --depth=1 [###_CHANGE_ME_###] $TMP

echo "[ $(date +%T) ] Moving scripts to $PWD..."
mv $TMP/build-container.sh $TMP/push-container.sh $PWD

echo "[ $(date +%T) ] Updating service names..."
sed -i '' "s/$SERVICE_PLACEHOLDER/$1/g" build-container.sh
sed -i '' "s/$SERVICE_PLACEHOLDER/$1/g" push-container.sh

echo "[ $(date +%T) ] Cleaning up..."
rm -rf $TMP

echo "[ $(date +%T) ] Complete..."
