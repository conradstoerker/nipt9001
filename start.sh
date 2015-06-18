#!/bin/bash

DATANAME='150423_COUNT_0015_AC6V7GANXX'
RUNFOLDERPATH='${DATALOC}'
DATETAG='$(date + "%Y%m%d")'
DOCKERFLOW='/mnt/scratch/devel/NIPT9001'

cp /mnt/scratch/devel/NIPT9001/echelon_src/2015-06-06WholeChr/*.pm /usr/lib64/perl5
export PERL5LIB=/mnt/scratch/devel/NIPT9001/dependencies/bcl2fastq/lib/bcl2fastq-1.8.3/perl”
export PERL5LIB=/mnt/scratch/devel/NIPT9001/echelon_src/2015-06-06WholeChr

#Command changed to run in the container
nohup /mnt/scratch/devel/NIPT9001/dependencies/anaconda/bin/python /mnt/scratch/devel/NIPT9001/src/NIPT9001_process_NGSrun_pyflow.py -c /mnt/scratch/devel/NIPT9001/config/docker_config.xml -r /mnt/production_storage/runs/hiseq/150423_COUNT_0015_AC6V7GANXX > /mnt/production_storage/workflows/docker/150423_COUNT_0015_AC6V7GANXX_20150618.out
#nohup /mnt/scratch/devel/NIPT9001/dependencies/anaconda/bin/python /mnt/scratch/devel/NIPT9001/src/NIPT9001_process_NGSrun_pyflow.py -c /mnt/scratch/devel/NIPT9001/config/docker_config.xml -r /mnt/production_storage/runs/hiseq/150423_COUNT_0015_AC6V7GANXX > /mnt/production_storage/workflows/docker/${DATANAME}_${DATETAG}.out
