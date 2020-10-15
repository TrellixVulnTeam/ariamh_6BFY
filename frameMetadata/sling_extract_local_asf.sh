#!/bin/bash

export ARIAMH_HOME=$HOME/ariamh
export FRAMEMETA_HOME=$ARIAMH_HOME/frameMetadata

source $HOME/verdi/bin/activate

slc_id=$1
request_id=$2

# sling extract to local from asf
python $FRAMEMETA_HOME/sling_extract_local_asf.py ${slc_id} ${request_id} > sling_extract_local_asf.log 2>&1
if [ $? -ne 0 ]; then
  echo "Failed to sling extract to local from asf." 1>&2
  cat sling_extract_local_asf.log 1>&2
  exit 1
fi