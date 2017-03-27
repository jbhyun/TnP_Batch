#!/bin/bash
infile=$1
outfile=$2
Period=$3
echo "[bash] infile : "$infile
echo "[bash] outfile : "$outfile
echo "[bash] Period : "$Period

filepath=/data1/Users/jskim/TagAndProbe/tree/SkimmedForDZFilter/
resultpath=/data1/Users/jskim/TagAndProbe/results/DZFilter/
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src
export SCRAM_ARCH=slc6_amd64_gcc530
cmsenv
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src/MuonAnalysis/TagAndProbe/test/zmumu/
echo "#### running fitter ####"
cmsRun fitMuonTriggerDZFilter_trilepton.py \
$filepath/$infile \
$resultpath/$outfile \
$Period
