
# Nextflow Pipeline for Genomic Data QC and MultiQC Reporting

## Overview
This pipeline is designed to download `.fastq.gz` files from a Synapse repository, run quality control (QC) using FastQC, and generate a combined report using MultiQC.

## Requirements
- **Nextflow**: Install from [nextflow.io](https://www.nextflow.io/).
- **Docker**: You will need docker running.

## Installation
1. Set `SYNAPSE_AUTH_TOKEN secret:
   - Ensure you have set your Synapse auth token as a Nextflow secret: `nextflow secrets set SYNAPSE_AUTH_TOKEN <your-auth-token>`

## Running the Pipeline
Run the pipeline with a prepared sample sheet (csv):
```bash
nextflow run ncihtan/nf-htan-qc --input_csv <your-samplesheet>.csv
```

You can run a test profile with

```bash
nextflow run ncihtan/nf-htan-qc --profile test
```


### Parameters
`input_csv`: Absolute path to the input CSV file. This file should have two columns:

- fastqc: A path, uri or synapse id to a fastq/fastq.gz file

`outdir`: Path to the directory where the MultiQC report will be stored

## Output
- The pipeline generates a `multiqc_report.html` file that combines all the QC outputs in a single report.
- Individual FastQC result files are stored in the directory specified by `params.outdir`
