################################################################
##                           bbduk                            ##
################################################################

cwlVersion: v1.0
class: CommandLineTool

################################################################
##            baseCommand and arguments definitions           ##
################################################################

baseCommand: [bbduk.sh]

requirements:
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.basedir)
      
arguments:
  - prefix: in
    valueFrom: $(inputs.in)
  - prefix: out
    valueFrom: $(inputs.out)
  - prefix: outm
    valueFrom: $(inputs.outm)
  - prefix: ref
    valueFrom: $(inputs.ref)
  - prefix: k
    valueFrom: $(inputs.k)
  - prefix: hdist
    valueFrom: $(inputs.hdist)
  - prefix: stats
    valueFrom: $(inputs.stats)
 
    
################################################################
##               Inputs and Outputs Settings                  ##
################################################################

inputs:
  in:
    type: File
  ref:
    label: phix.fa
    type: File
  k:
    label: 31
    type: int
  hdist:
    label: 1
    type: int

outputs:
   out:
    label: unmatched.fq
    type: File
  outm:
    label: matched.fq
    type: File
  stats:
    label: stats.txt
    type: File
    
stdout: $(inputs.results_path.basename)/$(inputs.SampleName).fastq

