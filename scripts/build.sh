#!/bin/bash

set -ex

PATH="$(npm bin):$PATH"
if [ -z "${APP_ENV+x}" ];
then
  echo 'APP_ENV is unset; please set to development, staging or production'
  exit 1
fi
export NODE_ENV=production

rm -rf dist/app
webpack
./scripts/buildHTML.js
cp -r src/app/UI/public/* dist/app
