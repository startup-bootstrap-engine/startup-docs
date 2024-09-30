#!/bin/bash

case $1 in
"dev")
  echo "Generating Development environment .env files"
  cp -fr ./environment/dev.env .env
  ;;

"prod")
  echo "Generating Production environment .env files"
  cp -fr ./environment/prod.env .env
  ;;

"debug")
  echo "Generating Debug WSL environment .env files"
  cp -fr ./environment/dev.env .env
  ;;

*)
  echo "Invalid environment option. Please provide 'dev' or 'prod'."
  exit 1
  ;;
esac

echo "✅ Done! Environment set to $1."
