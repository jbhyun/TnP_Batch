#!/bin/bash
infile=$1
outfile=$2
PassingProbeTrigger=$3
Period=$4
echo "[bash] infile : "$infile
echo "[bash] outfile : "$outfile
echo "[bash] PassingProbeTrigger : "$PassingProbeTrigger
echo "[bash] Period : "$Period

filepath=/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger
resultpath=/data1/Users/jskim/TagAndProbe/results
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src
export SCRAM_ARCH=slc6_amd64_gcc530
cmsenv
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src/MuonAnalysis/TagAndProbe/test/zmumu/
echo "#### running fitter ####"
cmsRun fitMuonTrigger_dilepton.py \
$filepath/$infile \
$resultpath/$outfile \
$PassingProbeTrigger \
$Period
