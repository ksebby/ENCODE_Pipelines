#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: [python, encode_bam2ta.py]
requirements:
  - class: InlineJavascriptRequirement
doc: |
  ENCODE DCC BAM 2 TAGALIGN.

inputs:
  
  bam:
    type: File
    doc: Path for BAM file.
    inputBinding:
      position: 1

  disable_tn5_shift:
    type: boolean?
    doc: Disable TN5 shifting for DNase-Seq.
    inputBinding:
      prefix: --disable-tn5-shift 

  regex_grep_v_ta:
    type: str
    default: chrM
    doc: Perl-style regular expression pattern to remove matching reads from TAGALIGN.
    inputBinding:
      valueFrom: ${return "'"+self+"'"}
      prefix: --regex-grep-v-ta 

  subsample:
    type: int
    default: 0
    doc: Subsample TAGALIGN. This affects all downstream analysis.
    inputBinding:
      prefix: --subsample 

  paired_end:
    type: boolean?
    doc: Paired-end BAM
    inputBinding:
      prefix: --paired-end 

  out_dir:
    type: string?
    default: 
    doc: Output directory.
    inputBinding:
      prefix: --out-dir 

  nth:
    type: int
    default: 1
    doc: Number of threads to parallelize.
    inputBinding:
      prefix: --nth 

  log_level:
    type: enum
    symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    default: INFO
    doc: Log level
    inputBinding:
      prefix: --log-level 


outputs:
  ta:
    type: File
    outputBinding:
      glob: "*.tagAlign.gz"


$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import: encode_script_meta.yaml


s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: bedtools bamtotbed
    s.version:
  - class: s:SoftwareApplication
    s.name: awk
    s.alternateName: gawk
    s.version:
  - class: s:SoftwareApplication
    s.name: grep
    s.version:
  - class: s:SoftwareApplication
    s.name: gzip
    s:alternateName: zcat
    s.version:
