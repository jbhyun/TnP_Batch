#!/bin/bash
qsub -q longq -N BCDEF_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_BCDEF.sh
qsub -q longq -N GH_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_GH.sh
qsub -q longq -N MC_maketree -wd /data1/Users/jskim/TagAndProbe/logs/ maketree_MC.sh







