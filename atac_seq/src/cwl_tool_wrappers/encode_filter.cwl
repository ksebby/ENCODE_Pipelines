#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: [python, encode_filter.py]

requirements:
  - class: InlineJavaScriptRequirement

doc: |
  ENCODE DCC filter.

inputs:
  
  bam:
    type: File
    doc: Path for raw BAM file.
    inputBinding:
      position: 1

  dup_marker:
    type:
      type: enum?
      symbols: ['picard', 'sambamba']
    doc: Dupe marker for filtering mapped reads in BAM.
    inputBinding:
      prefix: --dup-marker 

  mapq_thresh:
    type: int?
    doc: Threshold for low MAPQ reads removal.
    inputBinding:
      prefix: --mapq-thresh 

  no_dup_removal:
    type: boolean?
    doc: No dupe reads removal when filtering BAM.
    inputBinding:
      prefix: --no-dup-removal 

  paired_end:
    type: boolean?
    doc: Paired-end BAM.
    inputBinding:
      prefix: --paired-end 

  multimapping:
    type: int?
    doc: Multimapping reads.
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
  nodup_bam:
    type: File
    outputBinding:
      glob: "*.bam"
  nodup_bai:
    type: File
    outputBinding:
      glob: "*.bai"
  flagstat_qc:
    type: File
    outputBinding:
      glob: "*.flagstat.qc"
  dup_qc:
    type: File
    outputBinding:
      glob: |
        ${
          if (inputs.no_dup_removal)
            return []
          return "*.dup.qc"
          }
  pbc_qc:
    type: File
    outputBinding:
      glob: |
        ${
          if (inputs.no_dup_removal)
            return []
          return "*.pbc.qc"
          }


$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import: encode_script_meta.yaml


s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: samtools view
    s.version:
  - class: s:SoftwareApplication
    s.name: assign_multimappers.py
    s.version:
  - class: s:SoftwareApplication
    s.name: sambamba sort
    s.version:
  - class: s:SoftwareApplication
    s.name: sambamba index
    s.version:
  - class: s:SoftwareApplication
    s.name: sambamba flagstat
    s.version:
  - class: s:SoftwareApplication
    s.name: samtools sort
    s.version:
  - class: s:SoftwareApplication
    s.name: samtools fixmate
    s.version:
  - class: s:SoftwareApplication
    s.name: java -jar picard.jar MarkDuplicates
    s.alternateName: picard MarkDuplicates
    s.version:
  - class: s:SoftwareApplication
    s.name: sambamba markdup
    s.version:
  - class: s:SoftwareApplication
    s.name: bedtools
    s.version:
  - class: s:SoftwareApplication
    s.name: awk
    s:alternateName: gawk
    s.version:
  - class: s:SoftwareApplication
    s.name: grep
    s.version: