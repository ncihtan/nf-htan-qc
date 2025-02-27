process DownloadFromSynapse {
    label 'process_low'  

    container 'ghcr.io/sage-bionetworks/synapsepythonclient:v4.6.1'

    input:
    val synapse_id

    output:
    path '*.fastq.gz', optional: true

    script:
    """
    python3 ${baseDir}/modules/download_synapse.py ${synapse_id}
    """
}