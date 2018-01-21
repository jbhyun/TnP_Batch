#!/bin/sh
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src
export SCRAM_ARCH=slc6_amd64_gcc530
cmsenv
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src/TnPUtils

echo "####################"
echo "Skimming data tree"
echo "####################"
echo ""
./skimTree \
/data1/Users/jskim/TagAndProbe/tree/TnPTree_Run2016BCDEF_dXYSIG_ADDED.root  \
/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger/TnPTree_Run2016BCDEF_dXYSIG_ADDED_Skimmed.root  \
--remove "*" \
--keep "mass pt abseta dB dXYSig dzPV combRelIsoPF04dBeta tag_pt tag_combRelIsoPF04dBeta tag_IsoMu24 pt pair_probeMultiplicity DoubleIsoMu17Mu8_IsoMu17leg DoubleIsoMu17Mu8_IsoMu8leg DoubleIsoMu17TkMu8_IsoMu17leg DoubleIsoMu17TkMu8_IsoMu8leg tag_phi phi pair_deltaR Tight2012 tag_eta eta phi tag_phi Mu23_TrkIsoVVL IsoMu24 IsoTkMu24" \
--cut "tag_pt > 19.9999 && tag_combRelIsoPF04dBeta < 0.2 && tag_IsoMu24 == 1 && pt > 9.9999 && Tight2012 && dzPV > -0.5 && dzPV < 0.5 && combRelIsoPF04dBeta < 0.1 && dB < 0.05 && dXYSig < 3.0"
echo "Skimming done"

echo ""
echo "####################"
echo "Adding pair_dPhi"
echo "####################"
echo ""
./addBranch \
/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger/TnPTree_Run2016BCDEF_dXYSIG_ADDED_Skimmed.root \
/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger/TnPTree_Run2016BCDEF_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED.root \
"abs(tag_phi - phi) if abs(tag_phi - phi) < 3.1415926535 else 2*3.1415926535 - abs(tag_phi - phi);tag_eta;eta;phi;tag_phi" "pair_dPhi"

echo "####################"
echo "Adding pair_dPhiPrimeDeg"
echo "####################"
echo ""
./addBranch \
/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger/TnPTree_Run2016BCDEF_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED.root \
/data1/Users/jskim/TagAndProbe/tree/SkimmedForTrigger/TnPTree_Run2016BCDEF_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED.root \
"pair_dPhi*(180/3.1415926535) if ((tag_eta > 0.9 and eta > 0.9) or (tag_eta < -0.9 and eta < -0.9)) else 999;pair_dPhi;tag_eta;eta;phi;tag_phi" "pair_dPhiPrimeDeg"
echo ""
echo "#### DONE ####"
