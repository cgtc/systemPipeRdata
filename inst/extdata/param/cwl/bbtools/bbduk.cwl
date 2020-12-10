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
    inputBinding:
      position: 1
  out:
    label: "Out unmatched. Will get all the reads not part in ref "
    type: string
  outm:
    label: "Out matched. Will get the reads matched to ref "
    type: Directory
  ref:
    label: "Directory to write output to"
    type: Directory
  k:
    label: "Directory to write output to"
    type: Directory
  hdist:
    label: "Directory to write output to"
    type: Directory
  stats:
    label: "Directory to write output to"
    type: Directory

outputs:
    gunzip_file:
        type: stdout
    
stdout: $(inputs.results_path.basename)/$(inputs.SampleName).fastq


###########
## Notes ##
###########

## If the template its used in bash script with the "cwl-runner", run: 
# "cwl-runner --outdir <path>/ gunzip.cwl gunzip.yml"
