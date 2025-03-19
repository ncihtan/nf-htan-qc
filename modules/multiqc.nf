process MULTIQC {

    container "multiqc/multiqc:latest"
    publishDir "${params.outdir}", mode: 'copy'
    secret 'SEQERA_ACCESS_TOKEN'
    
    input:
    path('*', stageAs: 'tmp??/*')


    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc ${params.ai ? '--ai-summary-full --ai-provider seqera' : ''} .
    """
}
