process QC {
    label 'process_medium' 

    container 'biocontainers/fastqc:v0.11.9_cv7'

    input:
    path fastq_file

    output:
    path "fastqc_results/*", emit: qc_output

    script:
    """
    mkdir -p fastqc_results
    fastqc ${fastq_file} --outdir fastqc_results
    """
}