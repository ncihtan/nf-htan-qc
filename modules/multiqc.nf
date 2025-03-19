process MULTIQC {

    container "multiqc/multiqc:latest"
    publishDir "${params.outdir}", mode: 'copy'
    
    input:
    path('*', stageAs: 'tmp??/*')


    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc .
    """
}
