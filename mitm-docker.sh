#!/bin/sh

workspace="./WORKSPACE"
if [[ ! -f ${workspace} ]] || [[ ! $(head -n 1 ${workspace}) == *"gerrit"* ]]; then
    echo Please change to cloned Gerrit repo from https://gerrit.googlesource.com/gerrit/
    exit 1
fi

if [[ -z "$1" ]]; then
    echo This is a runner for higher-level scripts, e.g. mitm-serve-app-dev.sh
    echo Alternatively, pass mitmproxy script from the same dir as a parameter, e.g. serve-app-dev.py
    exit 1
fi

gerrit_dir=$(pwd)
mitm_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

CMD="${mitm_dir}/$1"

docker run --rm -it \
       -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy \
       -v ${mitm_dir}:${mitm_dir} \
       -v ${gerrit_dir}:${gerrit_dir} \
       -p 8888:8888 \
       mitmproxy/mitmproxy:2.0.2 \
       mitmdump -q -p 8888 -s "${CMD}"
