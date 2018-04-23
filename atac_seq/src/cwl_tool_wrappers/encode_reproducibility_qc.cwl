#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_reproducibility_qc.py --generate_cwl_tool
# Help: $ encode_reproducibility_qc.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_reproducibility_qc.py]

doc: |
  ENCODE DCC reproducibility QC. IDR peak or overlap peak only.

inputs:
  
  peaks:
    type:
      type: array
      items: File
    doc: List of peak files from true replicates in a sorted order. For example of 4 true replicates, 0,1 0,2 0,3 1,2 1,3 2,3. x,y means peak file from rep-x vs rep-y.
    inputBinding:
      position: 1

  peaks_pr:
    type:
      type: array
      items: File
    doc: List of peak files from pseudo replicates.
    inputBinding:
      prefix: --peaks-pr 

  peak_ppr:
    type: ["null", File]
    doc: Peak file from pooled pseudo replicate.
    inputBinding:
      prefix: --peak-ppr 

  prefix:
    type: ["null", string]
    doc: Basename prefix for reproducibility QC file.
    inputBinding:
      prefix: --prefix 

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
  reproducibility_qc:
    type: File
    outputBinding:
      glob: "*reproducibility.qc"


$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import:


s:softwareRequirements:
