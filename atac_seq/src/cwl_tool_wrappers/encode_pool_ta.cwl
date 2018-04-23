#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_pool_ta.py --generate_cwl_tool
# Help: $ encode_pool_ta.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_pool_ta.py]

doc: |
  ENCODE DCC TAGALIGN pooler.

inputs:
  
  tas:
    type:
      type: File
      items: string

    doc: List of TAGALIGNs to be pooled.
    inputBinding:
      position: 1

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
    ta_pooled:
      type: File
      outputBinding:
        glob: "*.tagAlign.gz"




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
