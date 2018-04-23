#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_macs2_atac.py --generate_cwl_tool
# Help: $ encode_macs2_atac.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_macs2_atac.py]

requirements:
  - class: InlineJavaScriptRequirement
doc: |
  ENCODE DCC MACS2 callpeak

inputs:
  
  ta:
    type: File
    doc: Path for TAGALIGN file.
    inputBinding:
      position: 1

  chrsz:
    type: File
    doc: 2-col chromosome sizes file.
    inputBinding:
      prefix: --chrsz 

  gensz:
    type: string
    doc: Genome size (sum of entries in 2nd column of chr. sizes file, or hs for human, ms for mouse).
    inputBinding:
      prefix: --gensz 

  pval_thresh:
    type: float
    default: 0.01
    doc: P-Value threshold.
    inputBinding:
      prefix: --pval-thresh 

  smooth_win:
    type: int
    default: 150
    doc: Smoothing window size.
    inputBinding:
      prefix: --smooth-win 

  cap_num_peak:
    type: int
    default: 300000
    doc: Capping number of peaks by taking top N peaks.
    inputBinding:
      prefix: --cap-num-peak 

  make_signal:
    type: boolean
    default: True
    doc: Generate signal tracks for P-Value and fold enrichment.
    inputBinding:
      prefix: --make-signal 

  blacklist:
    type: File
    doc: Blacklist BED file.
    inputBinding:
      prefix: --blacklist 

  out_dir:
    type: string
    default: ""
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

  peak_type:
    type: string
    default: "narrowPeak"


outputs:
  npeak:
    type: File
    outputBinding:
      glob: |
        ${
          return "*[!.][!b][!f][!i][!l][!t]"+ "." + inputs.peak_type+".gz"
          }
  bfilt_npeak:
    type: File
    outputBinding:
      glob: |
        ${
         return "*.bfilt."+inputs.peak_type+".gz"
          }
  sig_pval:
    type: File
    outputBinding:
      glob:  |
        ${
          if (inputs.make_signal)
            return "*.pval.signal.bigwig"
          return []
        }
  sig_fc:
    type: File?
    outputBinding:
      glob:  |
        ${
          if (inputs.make_signal)
            return "*.fc.signal.bigwig"
          return []
        }
  frip_qc:
    type: File
    outputBinding:
      glob: "*.frip.qc"


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
    s.name: sort
    s.version:
  - class: s:SoftwareApplication
    s.name: awk
    s.version:
  - class: s:SoftwareApplication
    s.name: head
    s.version:
  - class: s:SoftwareApplication
    s.name: macs2
    s.version:
  - class: s:SoftwareApplication
    s.name: bedtools
    s.version:
  - class: s:SoftwareApplication
    s.name: bedGraphToBigWig
    s.version: