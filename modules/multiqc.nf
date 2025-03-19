process MULTIQC {

    container "multiqc/multiqc:latest"
    publishDir "${params.outdir}", mode: 'copy'
    secret params.ai ? 'SEQERA_ACCESS_TOKEN' : null

    
    input:
    path('*', stageAs: 'tmp??/*')


    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc ${params.ai ? '--ai-summary-full --ai-provider seqera' : ''} .
    """
}
