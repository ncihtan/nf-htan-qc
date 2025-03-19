process SYNAPSE_GET {

    container "ghcr.io/sage-bionetworks/synapsepythonclient:v4.7.0"
    secret "SYNAPSE_AUTH_TOKEN"

    input:
    val meta

    output:
    tuple val(meta), path('*')

    script:
    """
    synapse get $meta.id
    """
}