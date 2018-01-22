#!/bin/bash
qsub -q fastq -N BCDEF_maketree -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_BCDEF.sh
qsub -q fastq -N GH_maketree -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_GH.sh
qsub -q fastq -N MC_maketree -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_MC.sh

#qsub -q fastq -N BCDEF_maketree_DZFilter -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_BCDEF_DZFilter.sh
#qsub -q fastq -N GH_maketree_DZFilter -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_GH_DZFilter.sh
#qsub -q fastq -N MC_maketree_DZFilter -wd /data1/Users/jskim/TnP_Batch/logs/ maketree_MC_DZFilter.sh
