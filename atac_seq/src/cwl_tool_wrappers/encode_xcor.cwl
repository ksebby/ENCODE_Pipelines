#!/usr/bin/env cwl-runner

cwlVersion: v1.0

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
    type: int?
    doc: Subsample TAGALIGN.
    inputBinding:
      prefix: --subsample 

  speak:
    type: int?
    doc: User-defined cross-corr. peak strandshift (-speak= in run_spp.R). Disabled if -1.
    inputBinding:
      prefix: --speak=
      separate: False

  paired_end:
    type: boolean?
    doc: Paired-end TAGALIGN.
    inputBinding:
      prefix: --paired-end 

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
      type: enum
      symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
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
  $import: encode_script_meta.yaml
