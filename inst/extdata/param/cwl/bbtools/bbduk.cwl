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
  - prefix: in=
    valueFrom: $(inputs.SampleName).fastq_trim.gz
  - prefix: out=
    valueFrom: $(inputs.SampleName)_unmatched.fastq_trim.gz
  - prefix: outm=
    valueFrom: $(inputs.SampleName)_matched.fastq_trim.gz
  - prefix: ref=
    valueFrom: $(inputs.ref)
  - prefix: k=
    valueFrom: $(inputs.k)
  - prefix: hdist=
    valueFrom: $(inputs.hdist)
  - prefix: stats=
    valueFrom: $(inputs.SampleName)_stats.txt
 
    
################################################################
##               Inputs and Outputs Settings                  ##
################################################################

inputs:
  in:
    type: File
  ref:
    label: reference fasta file, e.g. phix.fa
    type: File
  k:
    label: This will remove all reads that have a k-mer match with the reference fasta file
    type: int
  hdist:
    label: allowed mismatch in kmer, e.g. if set to 1, would allow 1 mismatch in a kmer (e.g. 31mer)
    type: int

outputs:
   out:
    label: catches reads that did not match any reference kmer
    type: File
    outputBinding:
      glob:  $(inputs.SampleName)_unmatched.fastq_trim.gz
   outm:
    label: catches reads that matched a reference kmers
    type: File
    outputBinding:
      glob:  $(inputs.SampleName)_matched.fastq_trim.gz
   stats:
    label: produces a report of which contaminant sequences were seen, and how many reads had them
    type: File
    outputBinding:
      glob:  $(inputs.SampleName)_stats.txt
    
