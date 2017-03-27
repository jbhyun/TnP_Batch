#!/bin/bash
qsub -q fastq -N BCDEF_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_BCDEF_DZFilter.sh
qsub -q fastq -N GH_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_GH_DZFilter.sh
qsub -q fastq -N MC_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_MC_DZFilter.sh







