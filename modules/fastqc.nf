process FASTQC {
    container 'biocontainers/fastqc:v0.11.9_cv7'
    publishDir "${params.outdir}/fastqc/", mode: 'copy'
    tag {"$meta.id"}

    input:
    tuple val(meta), path(fastq_file)

    output:
    tuple val(meta), path("*.html"), emit: html
    tuple val(meta),path("*.zip"), emit: zip

    script:
    """
    mkdir -p fastqc_results
    fastqc ${fastq_file}
    """
}