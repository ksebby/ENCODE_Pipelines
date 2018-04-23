#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: [python, encode_bowtie2.py]

doc: |
  ENCODE DCC bowtie2 aligner.

inputs:
  
  idx_tar:
    type: File
    doc: Path for prefix (or a tarball .tar) for reference bowtie2 index. Prefix must be like [PREFIX].1.bt2. Tar ball must be packed without compression and directory by using command line "tar cvf [TAR] [TAR_PREFIX].*.bt2".
    inputBinding:
      position: 1

  fastqs:
    type:
      type: array
      items: File
    doc: List of FASTQs (R1 and R2). FASTQs must be compressed with gzip (with .gz).
    inputBinding:
      position: 2

  score_min:
    type: string?
    doc: --score-min for bowtie2.
    inputBinding:
      prefix: --score-min 

  paired_end:
    type: boolean?
    doc: Paired-end FASTQs.
    inputBinding:
      prefix: --paired-end 

  multimapping:
    type: int?
    doc: Multimapping reads (for bowtie2 -k).
    inputBinding:
      prefix: --multimapping 

  nth:
    type: int?
    doc: Number of threads to parallelize.
    inputBinding:
      prefix: --nth 

  out_dir:
    type: string?
    doc: Output directory.
    inputBinding:
      prefix: --out-dir 

  log_level:
    type:
      type: enum?
      symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    doc: Log level
    inputBinding:
      prefix: --log-level 


outputs:
  bam:
    type: File
    outputBinding:
      glob: "*.bam"
  bai:
    type: File
    outputBinding:
      glob: "*.bai"
  align_log:
    type: File
    outputBinding:
      glob: "*.align.log"
  flagstat_qc:
    type: File
    outputBinding:
      glob: "*.flagstat.qc"



$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import: encode_script_meta.yaml


s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: bowtie2
    s.version:
  - class: s:SoftwareApplication
    s.name: samtools view
    s.version:
  - class: s:SoftwareApplication
    s.name: cat
    s.version: