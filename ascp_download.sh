#!/bin/bash
if [ $# -ne 2 ] ; then
        echo "ascp_download accession_list outdir"
        exit 0
fi

module load aspera-connect
file=$1
files=`cat $file`
files=($(echo $files | tr -d "\n"))
for srrfile in ${files[@]}
do
echo ${srrfile}
srrnum=${srrfile:0:6}
srrtype=${srrfile:0:3}
echo $srrtype
#wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/$srrnum/$srrfile/${srrfile}.sra
ascp -QTr -k 1 -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh -l 10000m anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/$srrtype/$srrnum/$srrfile/${srrfile}.sra $2
done


#ascp -QTr -k 1 -i ~/.aspera/connect/etc/asperaweb_id_dsa.openssh -l 600m anonftp@ftp.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/SRR304/SRR304976/SRR304976.sra  ./
