#!/usr/bin/env cwl-runner


cwlVersion: v1.0

class: CommandLineTool
baseCommand: [python, encode_qc_report.py]
requirements:
  - class: InlineJavascriptRequirement
doc: |
  ENCODE DCC generate HTML report and QC JSON.

inputs:
  
  name:
    type: string?
    doc: Name of sample.
    inputBinding:
      valueFrom: |
        ${
        return "'"+self+"'"
        }
      prefix: --name 

  desc:
    type: string?
    doc: Description for sample.
    inputBinding:
      valueFrom: |
        ${
        return "'"+self+"'"
        }
      prefix: --desc 

  paired_end:
    type: boolean?
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
      type: array?
      items: File
    doc: List of flagstat QC (raw BAM) files per replicate.
    inputBinding:
      prefix: --flagstat-qcs 

  nodup_flagstat_qcs:
      type: array?
      items: File
    doc: List of flagstat QC (filtered BAM) files per replicate.
    inputBinding:
      prefix: --nodup-flagstat-qcs 

  dup_qcs:
    type:
      type: array?
      items: File
    doc: List of dup QC files per replicate.
    inputBinding:
      prefix: --dup-qcs 

  pbc_qcs:
    type:
      type: array?
      items: File
    doc: List of PBC QC files per replicate.
    inputBinding:
      prefix: --pbc-qcs 

  ctl_flagstat_qcs:
    type:
      type: array?
      items: File
    doc: List of flagstat QC (raw BAM) files per control.
    inputBinding:
      prefix: --ctl-flagstat-qcs 

  ctl_nodup_flagstat_qcs:
    type:
      type: array?
      items: File
    doc: List of flagstat QC (filtered BAM) files per control.
    inputBinding:
      prefix: --ctl-nodup-flagstat-qcs 

  ctl_dup_qcs:
    type:
      type: array
      items: File
    doc: List of dup QC files per control.
    inputBinding:
      prefix: --ctl-dup-qcs 

  ctl_pbc_qcs:
    type:
      type: array?
      items: File
    doc: List of PBC QC files per control.
    inputBinding:
      prefix: --ctl-pbc-qcs 

  xcor_plots:
    type:
      type: array?
      items: File
    doc: List of cross-correlation QC plot files per replicate.
    inputBinding:
      prefix: --xcor-plots 

  xcor_scores:
    type:
      type: array?
      items: File
    doc: List of cross-correlation QC score files per replicate.
    inputBinding:
      prefix: --xcor-scores 

  jsd_plot:
    type:
      type: array?
      items: File
    doc: Fingerprint JSD plot.
    inputBinding:
      prefix: --jsd-plot 

  jsd_qcs:
    type:
      type: array?
      items: File
    doc: List of JSD qc files.
    inputBinding:
      prefix: --jsd-qcs 

  idr_plots:
    type:
      type: array?
      items: File
    doc: List of IDR plot files per a pair of two replicates.
    inputBinding:
      prefix: --idr-plots 

  idr_plots_pr:
    type:
      type: array?
      items: File
    doc: List of IDR plot files per replicate.
    inputBinding:
      prefix: --idr-plots-pr 

  idr_plot_ppr:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: IDR plot file for pooled pseudo replicate.
    inputBinding:
      prefix: --idr-plot-ppr 

  frip_qcs:
    type:
      type: array?
      items: File
    doc: List of FRiP score files per replicate.
    inputBinding:
      prefix: --frip-qcs 

  frip_qcs_pr1:
    type:
      type: array?
      items: File
    doc: List of FRiP score files for 1st pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-qcs-pr1 

  frip_qcs_pr2:
    type:
      type: array?
      items: File
    doc: List of FRiP score files for 2nd pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-qcs-pr2 

  frip_qc_pooled:
    type:
      type: array?
      items: string
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: FRiP score file for pooled replicates.
    inputBinding:
      prefix: --frip-qc-pooled 

  frip_qc_ppr1:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: FRiP score file for 1st pooled pseudo replicates.
    inputBinding:
      prefix: --frip-qc-ppr1 

  frip_qc_ppr2:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input. Since this wrapper describes the script...
    doc: FRiP score file for 2nd pooled pseudo replicates.
    inputBinding:
      prefix: --frip-qc-ppr2 

  frip_idr_qcs:
    type:
      type: array?
      items: File
    doc: List of IDR FRiP score files per a pair of two replicates.
    inputBinding:
      prefix: --frip-idr-qcs 

  frip_idr_qcs_pr:
    type:
      type: array?
      items: File

    doc: List of IDR FRiP score files for pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-idr-qcs-pr 

  frip_idr_qc_ppr:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: IDR FRiP score file for pooled pseudo replicates.
    inputBinding:
      prefix: --frip-idr-qc-ppr 

  frip_overlap_qcs:
    type:
      type: array?
      items: File
    doc: List of overlapping peak FRiP score files per a pair of two replicates.
    inputBinding:
      prefix: --frip-overlap-qcs 

  frip_overlap_qcs_pr:
    type:
      type: array?
      items: File
    doc: List of overlapping peak FRiP score files for pseudo replicates per replicate.
    inputBinding:
      prefix: --frip-overlap-qcs-pr 

  frip_overlap_qc_ppr:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: Overlapping peak FRiP score file for pooled pseudo replicates.
    inputBinding:
      prefix: --frip-overlap-qc-ppr 

  idr_reproducibility_qc:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: IDR reproducibility QC file.
    inputBinding:
      prefix: --idr-reproducibility-qc 

  overlap_reproducibility_qc:
    type:
      type: array?
      items: File
#Python script specifies multiple arguments. WDL specifies a single file input.
    doc: Overlapping peak reproducibility QC file.
    inputBinding:
      prefix: --overlap-reproducibility-qc 

  ataqc_log:
    type:
      type: array?
      items: string
    doc: ATAQC *_qc.txt.
    inputBinding:
      prefix: --ataqc-log 

  out_qc_html:
    type: string?
    doc: Output QC report HTML file.
    inputBinding:
      prefix: --out-qc-html 

  out_qc_json:
    type: string?
    doc: Output QC JSON file.
    inputBinding:
      prefix: --out-qc-json 

  log_level:
    type:
      type: enum?
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

