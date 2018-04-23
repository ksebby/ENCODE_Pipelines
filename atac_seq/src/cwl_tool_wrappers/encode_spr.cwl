#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_spr.py --generate_cwl_tool
# Help: $ encode_spr.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_spr.py]

doc: |
  ENCODE DCC pseudo replicator.

inputs:
  
  ta:
    type: File
    doc: Path for TAGALIGN file.
    inputBinding:
      position: 1

  paired_end:
    type: boolean
    default: False
    doc: Paired-end TAGALIGN.
    inputBinding:
      prefix: --paired-end 

  out_dir:
    type: ["null", string]
    default: 
    doc: Output directory.
    inputBinding:
      prefix: --out-dir 

  log_level:
    type: enum
    symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    default: INFO
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
