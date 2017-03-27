#!/bin/sh
source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src
export SCRAM_ARCH=slc6_amd64_gcc530
cmsenv
cd /data1/Users/jskim/cmssoftware/CMSSW_8_0_20/src/TnPUtils

TreeDir=/data1/Users/jskim/TagAndProbe/tree/

echo "####################"
echo "Add tag_dXYSig"
echo "####################"
echo ""
./addBranch \
$TreeDir/TnPTree_Run2016GH_dXYSIG_ADDED.root \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED.root \
"numpy.abs(tag_dB/tag_edB) if tag_edB > 0 else 0;tag_dB;tag_edB" tag_dXYSig

echo "####################"
echo "Skimming tree"
echo "####################"
echo ""
./skimTree \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED.root  \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed.root \
--remove "*" \
--keep "mass pair_probeMultiplicity pair_deltaR Tight2012 tag_dzPV dzPV tag_combRelIsoPF04dBeta combRelIsoPF04dBeta tag_dB dB tag_dXYSig dXYSig tag_pt pt tag_abseta abseta tag_eta eta tag_phi phi tag_DoubleIsoMu17Mu8_IsoMu17leg tag_DoubleIsoMu17Mu8dZ_Mu17leg tag_DoubleIsoMu17Mu8_IsoMu8leg tag_DoubleIsoMu17TkMu8_IsoMu8leg DoubleIsoMu17Mu8_IsoMu17leg DoubleIsoMu17Mu8dZ_Mu17leg DoubleIsoMu17Mu8_IsoMu8leg DoubleIsoMu17TkMu8_IsoMu8leg" \
--cut "pair_probeMultiplicity == 1 && tag_dzPV > -0.5 && tag_dzPV < 0.5 && tag_combRelIsoPF04dBeta < 0.1 && tag_dB < 0.05 && tag_dXYSig < 3.0 && Tight2012 && dzPV > -0.5 && dzPV < 0.5 && combRelIsoPF04dBeta < 0.1 && dB < 0.05 && dXYSig < 3.0 && tag_pt > 9.9999 && pt > 9.9999"
echo "Skimming done"

echo ""
echo "####################"
echo "Adding pair_dPhi"
echo "####################"
echo ""
./addBranch \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed.root \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED.root \
"abs(tag_phi - phi) if abs(tag_phi - phi) < 3.1415926535 else 2*3.1415926535 - abs(tag_phi - phi);tag_eta;eta;phi;tag_phi" "pair_dPhi"

echo "####################"
echo "Adding pair_dPhiPrimeDeg"
echo "####################"
echo ""
./addBranch \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED.root \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED.root \
"pair_dPhi*(180/3.1415926535) if ((tag_eta > 0.9 and eta > 0.9) or (tag_eta < -0.9 and eta < -0.9)) else 999;pair_dPhi;tag_eta;eta;phi;tag_phi" "pair_dPhiPrimeDeg"
echo ""
echo "### DONE ####"

echo "####################"
echo "Add Mu8_OR_TkMu8"
echo "####################"
echo ""
./addBranch \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED.root \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED_Mu8_OR_TkMu8_ADDED.root \
"1 if (DoubleIsoMu17Mu8_IsoMu8leg==1 or DoubleIsoMu17TkMu8_IsoMu8leg==1) else 0;DoubleIsoMu17Mu8_IsoMu8leg;DoubleIsoMu17TkMu8_IsoMu8leg" "Mu8_OR_TkMu8"

echo "####################"
echo "Add tag_Mu8_OR_TkMu8"
echo "####################"
echo ""
./addBranch \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED_Mu8_OR_TkMu8_ADDED.root \
$TreeDir/SkimmedForDZFilter/TnPTree_Run2016GH_dXYSIG_ADDED_tag_dXYSIG_ADDED_Skimmed_pair_dPhi_ADDED_pair_dPhiPrimeDeg_ADDED_Mu8_OR_TkMu8_ADDED_tag_Mu8_OR_TkMu8_ADDED.root \
"1 if (tag_DoubleIsoMu17Mu8_IsoMu8leg==1 or tag_DoubleIsoMu17TkMu8_IsoMu8leg==1) else 0;tag_DoubleIsoMu17Mu8_IsoMu8leg;tag_DoubleIsoMu17TkMu8_IsoMu8leg" "tag_Mu8_OR_TkMu8"

./addBranch \
$TreeDir/SkimmedForDZFilter/GH.root \
$TreeDir/SkimmedForDZFilter/GH_tmp1.root \
"1 if (tag_DoubleIsoMu17Mu8_IsoMu17leg==1 and Mu8_OR_TkMu8==1) else 0;tag_DoubleIsoMu17Mu8_IsoMu17leg;Mu8_OR_TkMu8" "LeadTrail"

./addBranch \
$TreeDir/SkimmedForDZFilter/GH_tmp1.root \
$TreeDir/SkimmedForDZFilter/GH_tmp2.root \
"1 if (tag_DoubleIsoMu17Mu8dZ_Mu17leg==1 and Mu8_OR_TkMu8==1) else 0;tag_DoubleIsoMu17Mu8dZ_Mu17leg;Mu8_OR_TkMu8" "LeadTrail_DZ"

./addBranch \
$TreeDir/SkimmedForDZFilter/GH_tmp2.root \
$TreeDir/SkimmedForDZFilter/GH_tmp3.root \
"1 if (DoubleIsoMu17Mu8_IsoMu17leg==1 and tag_Mu8_OR_TkMu8==1) else 0;DoubleIsoMu17Mu8_IsoMu17leg;tag_Mu8_OR_TkMu8" "TrailLead"

./addBranch \
$TreeDir/SkimmedForDZFilter/GH_tmp3.root \
$TreeDir/SkimmedForDZFilter/GH_tmp4.root \
"1 if (DoubleIsoMu17Mu8dZ_Mu17leg==1 and tag_Mu8_OR_TkMu8==1) else 0;DoubleIsoMu17Mu8dZ_Mu17leg;tag_Mu8_OR_TkMu8" "TrailLead_DZ"

./skimTree \
$TreeDir/SkimmedForDZFilter/GH_tmp4.root \
$TreeDir/SkimmedForDZFilter/GH_tmp5.root \
--cut "LeadTrail==1 || TrailLead==1"

./addBranch \
$TreeDir/SkimmedForDZFilter/GH_tmp5.root \
$TreeDir/SkimmedForDZFilter/GH_tmp6.root \
"1 if (LeadTrail_DZ==1 or TrailLead_DZ==1) else 0;LeadTrail_DZ;TrailLead_DZ" "PassDZTrigger"








