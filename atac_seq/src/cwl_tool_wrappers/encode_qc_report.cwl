#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: encode_qc_report.py
requirements:
  - class: InlineJavascriptRequirement
doc: |
  ENCODE DCC generate HTML report and QC JSON.

inputs:
  
  name:
    type: ["null", string]
    doc: Name of sample.
    inputBinding:
      valueFrom: |
        ${
        return "'"+self+"'"
        }
      prefix: --name 

  desc:
    type: ["null", string]
    doc: Description for sample.
    inputBinding:
      valueFrom: |
        ${
        return "'"+self+"'"
        }
      prefix: --desc 

  paired_end:
    type: ["null", boolean]
    doc: Paired-end sample.
    inputBinding:
      prefix: --paired-end 

  pipeline_type:
    type:
      type: enum
      symbols: ['atac', 'dnase', 'tf', 'histone']
    doc: Pipeline type.
    inputBinding:
      prefix: --pipeline-type 

  peak_caller:
    type: string
    doc: Description for sample.
    inputBinding:
      prefix: --peak-caller 

  idr_thresh:
    type: float
    doc: IDR threshold.
    inputBinding:
      prefix: --idr-thresh

  flagstat_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of flagstat QC (raw BAM) files per replicate.
    inputBinding:
      prefix: --flagstat-qcs

  nodup_flagstat_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of flagstat QC (filtered BAM) files per replicate.
    inputBinding:
      prefix: --nodup-flagstat-qcs

  dup_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of dup QC files per replicate.
    inputBinding:
      prefix: --dup-qcs

  pbc_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of PBC QC files per replicate.
    inputBinding:
      prefix: --pbc-qcs

  ctl_flagstat_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of flagstat QC (raw BAM) files per control.
    inputBinding:
      prefix: --ctl-flagstat-qcs

  ctl_nodup_flagstat_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of flagstat QC (filtered BAM) files per control.
    inputBinding:
      prefix: --ctl-nodup-flagstat-qcs

  ctl_dup_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of dup QC files per control.
    inputBinding:
      prefix: --ctl-dup-qcs

  ctl_pbc_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of PBC QC files per control.
    inputBinding:
      prefix: --ctl-pbc-qcs

  xcor_plots:
    type:
    - "null"
    - type: array
      items: string
    doc: List of cross-correlation QC plot files per replicate.
    inputBinding:
      prefix: --xcor-plots

  xcor_scores:
    type:
    - "null"
    - type: array
      items: string
    doc: List of cross-correlation QC score files per replicate.
    inputBinding:
      prefix: --xcor-scores

  jsd_plot:
    type:
    - "null"
    - type: array
      items: string
    doc: Fingerprint JSD plot.
    inputBinding:
      prefix: --jsd-plot
  jsd_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of JSD qc files.
    inputBinding:
      prefix: --jsd-qcs

  idr_plots:
    type:
    - "null"
    - type: array
      items: string
    doc: List of IDR plot files per a pair of two replicates.
    inputBinding:
      prefix: --idr-plots

  idr_plots_pr:
    type:
    - "null"
    - type: array
      items: string
    doc: List of IDR plot files per replicate.
    inputBinding:
      prefix: --idr-plots-pr

  idr_plot_ppr:
    type:
    - "null"
    - type: array
      items: string
    doc: IDR plot file for pooled pseudo replicate.
    inputBinding:
      prefix: --idr-plot-ppr

  frip_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of FRiP score files per replicate.
    inputBinding:
      prefix: --frip-qcs

  frip_qcs_pr1:
    type:
    - "null"
    - type: array
      items: string
    doc: List of FRiP score files for 1st pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-qcs-pr1

  frip_qcs_pr2:
    type:
    - "null"
    - type: array
      items: string
    doc: List of FRiP score files for 2nd pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-qcs-pr2

  frip_qc_pooled:
    type:
    - "null"
    - type: array
      items: string
    doc: FRiP score file for pooled replicates.
    inputBinding:
      prefix: --frip-qc-pooled


  frip_qc_ppr1:
    type:
    - "null"
    - type: array
      items: string
    doc: FRiP score file for 1st pooled pseudo replicates.
    inputBinding:
      prefix: --frip-qc-ppr1

  frip_qc_ppr2:
    type:
    - "null"
    - type: array
      items: string
    doc: FRiP score file for 2nd pooled pseudo replicates.
    inputBinding:
      prefix: --frip-qc-ppr2

  frip_idr_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of IDR FRiP score files per a pair of two replicates.
    inputBinding:
      prefix: --frip-idr-qcs

  frip_idr_qcs_pr:
    type:
    - "null"
    - type: array
      items: string
    doc: List of IDR FRiP score files for pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-idr-qcs-pr

  frip_idr_qc_ppr:
    type:
    - "null"
    - type: array
      items: string
    doc: IDR FRiP score file for pooled pseudo replicates.
    inputBinding:
      prefix: --frip-idr-qc-ppr

  frip_overlap_qcs:
    type:
    - "null"
    - type: array
      items: string
    doc: List of overlapping peak FRiP score files per a pair of two replicates.
    inputBinding:
      prefix: --frip-overlap-qcs

  frip_overlap_qcs_pr:
    type:
    - "null"
    - type: array
      items: string
    doc: List of overlapping peak FRiP score files for pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-overlap-qcs-pr

  frip_overlap_qc_ppr:
    type:
    - "null"
    - type: array
      items: string
    doc: Overlapping peak FRiP score file for pooled pseudo replicates.
    inputBinding:
      prefix: --frip-overlap-qc-ppr

  idr_reproducibility_qc:
    type:
    - "null"
    - type: array
      items: string
    doc: IDR reproducibility QC file.
    inputBinding:
      prefix: --idr-reproducibility-qc

  overlap_reproducibility_qc:
    type:
    - "null"
    - type: array
      items: string
    doc: Overlapping peak reproducibility QC file.
    inputBinding:
      prefix: --overlap-reproducibility-qc

  ataqc_log:
    type:
    - "null"
    - type: array
      items: string
    doc: ATAQC *_qc.txt.
    inputBinding:
      prefix: --ataqc-log


  out_qc_html:
    type: ["null", string]
    doc: Output QC report HTML file.
    inputBinding:
      prefix: --out-qc-html 

  out_qc_json:
    type: ["null", string]
    doc: Output QC JSON file.
    inputBinding:
      prefix: --out-qc-json 

  log_level:
    type:
      - "null"
      - type: enum
        symbols: ['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'CRITICAL', 'ERROR', 'CRITICAL']
    doc: Log level
    inputBinding:
      prefix: --log-level 


outputs:
  report:
    type: File
    outputBinding:
      glob: "*qc.html"
  qc_json:
    type: File
    outputBinding:
      glob: "*qc.json"



$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/docs/schema_org_rdfa.html

s:mainEntity:
  $import: encode_script_meta.yaml


s:softwareRequirements:

