#!/bin/sh

export aSamplePath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -e "${aSamplePath}/env.sh" ]; then source "${aSamplePath}/env.sh"; fi
cd $aSamplePath

host=`uname -s`
STATION=$host

RES_DIR="${aSamplePath}/res"
BIN_DIR="${aSamplePath}/${STATION}/bin"

CSF_ResourcesDefaults="${RES_DIR}"
CSF_IEResourcesDefaults="${RES_DIR}"

PATH="${BIN_DIR}:${PATH}"

export CSF_IEResourcesDefaults CSF_ResourcesDefaults
export PATH

if test ! -r "${BIN_DIR}/IESample"; then
   echo "Executable \"${BIN_DIR}/IESample\" not found."
   echo "Probably you don't compile the application. Execute \"make\"."
   exit 1
fi

${BIN_DIR}/IESample
