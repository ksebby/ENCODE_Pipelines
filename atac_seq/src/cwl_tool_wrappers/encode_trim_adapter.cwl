#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_trim_adapter.py --generate_cwl_tool
# Help: $ encode_trim_adapter.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_trim_adapter.py]

doc: |
  ENCODE DCC adapter trimmer.

inputs:
  
  fastqs:
    type:
      type: array
      items: File
    doc: TSV file path or list of FASTQs. FASTQs must be compressed with gzip (with .gz). Use TSV for multiple fastqs to be merged later. row=merge_id, col=end_id).
    inputBinding:
      position: 1

  auto_detect_adapter:
    type: boolean
    default: False
    doc: Automatically detect/trim adapters (supported system - Illumina, Nextera and smallRNA).
    inputBinding:
      prefix: --auto-detect-adapter 

  min_trim_len:
    type: int
    default: 5
    doc: Minimum trim length for cutadapt -m (throwing away processed reads shorter than this).
    inputBinding:
      prefix: --min-trim-len 

  err_rate:
    type: float
    default: 0.1
    doc: Maximum allowed adapter error rate for cutadapt -e (no. errors divided by the length of the matching adapter region).
    inputBinding:
      prefix: --err-rate 

  adapters:
    type: array
    items: File

    doc: TSV file path or list of adapter strings. Use TSV for multiple fastqs to be merged later. row=merge_id, col=end_id).
    inputBinding:
      prefix: --adapters 

  paired_end:
    type: boolean
    default: False
    doc: Paired-end FASTQs.
    inputBinding:
      prefix: --paired-end 

  nth:
    type: int
    default: 1
    doc: Number of threads to parallelize.
    inputBinding:
      prefix: --nth 

  out_dir:
    type: ["null", string]
    default: 
    doc: Output directory.
    inputBinding:
      prefix: --out-dir 

  log_level:
    type:
    - "null"
    - type: enum
      symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    default: INFO
    doc: Log level
    inputBinding:
      prefix: --log-level 


outputs:
  trimmed_merged_fastqs:
    type: array
    items: File
    outputBinding:
      glob: merge_fastqs_R?_*.fastq.gz


$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import:

s:isPartOf:
  class: s:CreativeWork
  s:name: Common Workflow Language
  s:url: http://commonwl.org/

s:author:
  class: s:Person
  s:name:
  s:email: mailto:
  s:sameAs:
  - id:
  s:worksFor:
  - class: s:Organization
    s:name:
    s:location:
    s:department:
    - class: s:Organization
      s:name:

s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: cutadapt
    s.version:
  - class: s:SoftwareApplication
    s.name: zcat
    s.alternateName: gzip
    s.version:
