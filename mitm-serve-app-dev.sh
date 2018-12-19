#!/bin/sh

mitm_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

${mitm_dir}/dev-chrome.sh &

${mitm_dir}/mitm-docker.sh "serve-app-dev.py --app $(pwd)/polygerrit-ui/app/"
