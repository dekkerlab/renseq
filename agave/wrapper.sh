#!/bin/bash

H5="${h5}"
ADAPTERS="${adapters}"

GSIZE="${genomesize}"
RCUTOFF="${readcutoff}"

echo arguments = ${adapters} ${h5} >> lib/condorsubmit.htc
H5COMMA=`echo ${h5} | sed -e 's/ /,/g'`
echo transfer_input_files = ${adapters},$H5COMMA >> lib/condorsubmit.htc
echo queue >> lib/condorsubmit.htc

jobid=`condor_submit lib/condorsubmit.htc`
jobid=`echo $jobid | sed -e 's/Sub.*uster //'`
jobid=`echo $jobid | sed -e 's/\.//'`

#echo $jobid

#echo going to monitor job $jobid
condor_tail -f $jobid

exit 0