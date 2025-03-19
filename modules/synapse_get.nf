process SYNAPSE_GET {

    container "ghcr.io/sage-bionetworks/synapsepythonclient:v4.7.0"
    secret "SYNAPSE_AUTH_TOKEN"
    tag {"$meta.id"}

    input:
    val meta

    output:
    tuple val(meta), path('*')

    script:
    """
    synapse get $meta.id
    """
}


process SYNAPSE_QUERY {

    container "ghcr.io/sage-bionetworks/synapsepythonclient:v4.7.0"
    secret 'SYNAPSE_AUTH_TOKEN'

    input:
    val query

    output:
    path 'samplesheet.csv'

    script:
    """
    synapse query "${query}" > samplesheet.tsv
    tail -n +2 samplesheet.tsv | cut -f4 | sed '1s/^id/fastq/' > samplesheet.csv
    """
}