#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: encode_spr.py

doc: |
  ENCODE DCC pseudo replicator.

inputs:
  
  ta:
    type: File
    doc: Path for TAGALIGN file.
    inputBinding:
      position: 1

  paired_end:
    type: ["null", boolean]
    doc: Paired-end TAGALIGN.
    inputBinding:
      prefix: --paired-end 

  out_dir:
    type: ["null", string]
    doc: Output directory.
    inputBinding:
      prefix: --out-dir 

  log_level:
    type:
      - "null"
      - type: enum
        symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    doc: Log level
    inputBinding:
      prefix: --log-level 


outputs:
  ta_pr1:
    type: File
    outputBinding:
      glob: "*.pr1.tagAlign.gz"
  ta_pr2:
    type: File
    outputBinding:
      glob: "*.pr1.tagAlign.gz"



$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import: encode_script_meta.yaml

s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: zcat
    s.alternateName: gzip
    s.version:
  - class: s:SoftwareApplication
    s.name: split
    s.version:
  - class: s:SoftwareApplication
    s.name: shuf
    s.version:
  - class: s:SoftwareApplication
    s.name: awk
    s.alternateName: gawk
    s.version:
