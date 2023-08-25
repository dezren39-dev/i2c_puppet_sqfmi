#!/usr/bin/env bash

get_submodule_status() {
  submodule_path="$1"
  submodule_status=$(git submodule status "$submodule_path")

  # Check the first character of the output to determine the status
  case "${submodule_status:0:1}" in
    '-')
      return 0
      ;;
    ' ')
      return 1
      ;;
    '+')
      return 2
      ;;
    *)
      return 3
      ;;
  esac
}

echo_submodule_status() {
  submodule_path="$1"
  status_code="$2"

  case $status_code in
    0)
      echo "The submodule at $submodule_path is not initialized."
      ;;
    1)
      echo "The submodule at $submodule_path is initialized but not updated."
      ;;
    2)
      echo "The submodule at $submodule_path is initialized and has changes."
      ;;
    3)
      echo "Unknown status for the submodule at $submodule_path."
      ;;
  esac
}

submodule_status() {
  submodule_path="$1"
  get_submodule_status "$submodule_path"
  status_code=$?
  echo_submodule_status "$submodule_path" $status_code
  return $status_code
}

submodule_status $(pwd)
status_code=$?

if [[ $status_code -eq 0 ]]; then
  git submodule update --init
fi

cd 3rdparty/pico-sdk

git submodule update --init

cd ../..
