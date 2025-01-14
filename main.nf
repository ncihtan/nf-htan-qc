nextflow.enable.dsl=2

include { DownloadFromSynapse } from './modules/download.nf'
include { QC } from './modules/qc.nf'
include { MultiQC } from './modules/multiqc.nf'

workflow {
    // Get the input CSV file from command-line arguments
    input_csv = params.input_csv ?: 'input.csv'

    // Download files specified in the input CSV
    downloaded_files = DownloadFromSynapse(input_csv)

    // Properly filter to get only .fastq.gz files
    fastq_files = downloaded_files.flatten().filter { it.toString().endsWith('.fastq.gz') }

    // Run QC on each .fastq.gz file directly
    qc_results = QC(fastq_files)

    // Run MultiQC on the collected QC results
    MultiQC(qc_results)
}
