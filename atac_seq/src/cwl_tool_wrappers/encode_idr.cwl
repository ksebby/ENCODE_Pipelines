#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.3-2
# To generate again: $ encode_idr.py --generate_cwl_tool
# Help: $ encode_idr.py --help_arg2cwl

cwlVersion: "cwl:v1.0"

class: CommandLineTool
baseCommand: [python, encode_idr.py]

doc: |
  ENCODE DCC IDR. NarrowPeak or RegionPeak only.

inputs:
  
  peak1:
    type: File
    doc: Peak file 1.
    inputBinding:
      position: 1

  peak2:
    type: File
    doc: Peak file 2.
    inputBinding:
      position: 2

  peak_pooled:
    type: File
    doc: Pooled peak file.
    inputBinding:
      position: 3

  prefix:
    type: ["null", string]
    default: idr
    doc: Prefix basename for output IDR peak.
    inputBinding:
      prefix: --prefix 

  peak_type:
    type:
      type: enum
      symbols: ['narrowPeak', 'regionPeak', 'broadPeak', 'gappedPeak']
    doc: Peak file type.
    inputBinding:
      prefix: --peak-type 

  idr_thresh:
    type: ["null", float]
    default: 0.1
    doc: IDR threshold.
    inputBinding:
      prefix: --idr-thresh 

  idr_rank:
    type:
    - "null"
    - type: enum
      symbols: ['p.value', 'q.value', 'signal.value']
    default: p.value
    doc: IDR ranking method.
    inputBinding:
      prefix: --idr-rank 

  blacklist:
    type: File
    doc: Blacklist BED file.
    inputBinding:
      prefix: --blacklist 

  ta:
    type: ["null", File]
    doc: TAGALIGN file for FRiP.
    inputBinding:
      prefix: --ta 

  chrsz:
    type: ["null", File]
    doc: 2-col chromosome sizes file.
    inputBinding:
      prefix: --chrsz 

  fraglen:
    type: ["null", int]
    default: 0
    doc: Fragment length for TAGALIGN file. If given, do shifted FRiP (for ChIP-Seq).
    inputBinding:
      prefix: --fraglen 

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
  idr_peak:
    type: File
    outputBinding:
      glob: |
        ${
          return "*[!.][!b][!f][!i][!l][!t]."+inputs.peak_type+".gz"
        }
  bfilt_idr_peak:
    type: File
    outputBinding:
      glob: |
        ${
          if (inputs.blacklist)
            return "*.bfilt."+inputs.peak_type+".gz"
          return outputs.idr_peak
        }
  idr_plot:
    type: File
    outputBinding:
      glob: "*.txt.png"
  idr_unthresholded_peak:
    type: File
    outputBinding:
      glob: "*.txt.gz"
  idr_log:
    type: File
    outputBinding:
      glob: |
        ${
          if (inputs.ta)
            return "*.frip.qc"
          return []
        }




$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import:


s:softwareRequirements:
  - class: s:SoftwareApplication
    s.name: awk
    s.alternateName: gawk
    s.version:
  - class: s:SoftwareApplication
    s.name: idr
    s.version:
  - class: s:SoftwareApplication
    s.name: zcat
    s.alternateName: gzip
    s.version: