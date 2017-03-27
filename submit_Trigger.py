import os

infile = ["MC.root", "BCDEF.root", "GH.root"]
#triggers = ["DoubleIsoMu17Mu8_IsoMu17leg", "DoubleIsoMu17Mu8_IsoMu8leg", "DoubleIsoMu17TkMu8_IsoMu17leg", "DoubleIsoMu17TkMu8_IsoMu8leg", "Mu8_OR_TkMu8", "test1"]
#triggers = ["DoubleIsoMu17Mu8_IsoMu17leg", "Mu8_OR_TkMu8"]
triggers = ["DoubleIsoMu17Mu8_IsoMu17leg"]

whichq = "fastq"

DoSubmit=False

for trigger in triggers:
  ## MC, BCDEF
  cmd = 'qsub -q '+whichq+' -N MC_BtoF_'+trigger+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[0]+' '+trigger+'_MC_BCDEF.root '+trigger+' BCDEF'
  print cmd
  if DoSubmit:
    os.system(cmd)
  ## MC, GH
  cmd = 'qsub -q '+whichq+' -N MC_GtoH_'+trigger+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[0]+' '+trigger+'_MC_GH.root '+trigger+' GH'
  print cmd
  if DoSubmit:
    os.system(cmd)
  ## Data, BCDEF
  cmd = 'qsub -q '+whichq+' -N Data_BtoF_'+trigger+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[1]+' '+trigger+'_Data_BCDEF.root '+trigger+' BCDEF'
  print cmd
  if DoSubmit:
    os.system(cmd)
  ## Data, GH
  cmd = 'qsub -q '+whichq+' -N Data_GtoH_'+trigger+' -wd /data1/Users/jskim/TagAndProbe/logs/ TagAndProbe_Trigger.sh '+infile[2]+' '+trigger+'_Data_GH.root '+trigger+' GH'
  print cmd
  if DoSubmit:
    os.system(cmd)
