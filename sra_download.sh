#!/bin/bash
file=$1
files=`cat $file`
files=($(echo $files | tr -d "\n"))
#srrnum=${files[0]:0:6}
#echo ${files[0]}
for srrfile in ${files[@]}
do
echo ${srrfile}
srrnum=${srrfile:0:6}
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/$srrnum/$srrfile/${srrfile}.sra
done

