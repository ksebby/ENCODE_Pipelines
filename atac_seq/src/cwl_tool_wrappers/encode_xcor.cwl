#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_xcor.py --generate_cwl_tool
# Help: $ encode_xcor.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_xcor.py]

doc: |
  ENCODE DCC cross-correlation analysis.

inputs:
  
  ta:
    type: File
    doc: Path for TAGALIGN file.
    inputBinding:
      position: 1

  subsample:
    type: int
    default: 0
    doc: Subsample TAGALIGN.
    inputBinding:
      prefix: --subsample 

  speak:
    type: int
    default: -1
    doc: User-defined cross-corr. peak strandshift (-speak= in run_spp.R). Disabled if -1.
    inputBinding:
      prefix: --speak=
      separate: False

  paired_end:
    type: boolean
    default: False
    doc: Paired-end TAGALIGN.
    inputBinding:
      prefix: --paired-end 

  nth:
    type: int
    default: 1
    doc: Number of threads to parallelize.
    inputBinding:
      prefix: --nth 

  out_dir:
    type: string
    default: ''
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
  plot_pdf:
    type: File
    outputBinding:
      glob: "*.cc.plot.pdf"
  plot_png:
    type: File
    outputBinding:
      glob: "*.cc.plot.png"
  score:
    type: File
    outputBinding:
      glob: "*.cc.qc"
  fraglen:
    type: File
    doc: Text file that contains one line with one integer.
    outputBinding:
     glob: *.cc.fraglen.txt


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
    s.name: Rscript
    s.version:
  - class: s:SoftwareApplication
    s.name: sed
    s.version:
  - class: s:SoftwareApplication
    s.name: echo
    s.version:
