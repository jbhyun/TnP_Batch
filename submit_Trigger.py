import os

infile = ["MC.root", "BCDEF.root", "GH.root"]

#triggers = ["DoubleIsoMu17Mu8_IsoMu17leg", "Mu8_OR_TkMu8"]
#triggers = ["Mu23_TrkIsoVVL", 'IsoMu24_OR_IsoTkMu24']
triggers = ['Mu8']

systs = ["Central", "NMassBins30", "NMassBins50", "MassRange_60_130", "MassRange_70_120", "SignalShapeSingleV", "TagPt30Iso0p08", "TagPt20IsoInf", "ProbeMult99"]
#systs = ["Central"]
#systs = ["NMassBins30", "NMassBins50", "MassRange_60_130", "MassRange_70_120", "SignalShapeSingleV", "TagPt30Iso0p08", "TagPt20IsoInf", "ProbeMult99"]

#systs = ["Central"]
#systs = ["NMassBins30", "NMassBins50"]
#systs = ["MassRange_60_130", "MassRange_70_120"]
#systs = ["SignalShapeSingleV"]
#systs = ["TagPt30Iso0p08", "TagPt20IsoInf"]
#systs = ["ProbeMult99"]


whichq = "fastq"

DoSubmit=True


for syst in systs:

  for trigger in triggers:
    ## MC, BCDEF
    cmd = 'qsub -q '+whichq+' -N MC_BtoF_'+trigger+'_'+syst+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[0]+' '+trigger+'_MC_BCDEF.root '+trigger+' BCDEF '+syst
    print cmd
    if DoSubmit:
      os.system(cmd)
    ## MC, GH
    cmd = 'qsub -q '+whichq+' -N MC_GtoH_'+trigger+'_'+syst+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[0]+' '+trigger+'_MC_GH.root '+trigger+' GH '+syst
    print cmd
    if DoSubmit:
      os.system(cmd)
    ## Data, BCDEF
    cmd = 'qsub -q '+whichq+' -N Data_BtoF_'+trigger+'_'+syst+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[1]+' '+trigger+'_Data_BCDEF.root '+trigger+' BCDEF '+syst
    print cmd
    if DoSubmit:
      os.system(cmd)
    ## Data, GH
    cmd = 'qsub -q '+whichq+' -N Data_GtoH_'+trigger+'_'+syst+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[2]+' '+trigger+'_Data_GH.root '+trigger+' GH '+syst
    print cmd
    if DoSubmit:
      os.system(cmd)
