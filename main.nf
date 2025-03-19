nextflow.enable.dsl=2

include {GET} from './workflows/get.nf'
include { QC } from './workflows/qc.nf'
include { SYNAPSE_QUERY } from './modules/synapse_get.nf'

params.outdir = 'outputs'
params.ai = false
params.query = "SELECT id FROM syn20446927 WHERE name LIke '%fastq.gz' ORDER BY dataFileSizeBytes LIMIT 100"
params.use_query = false

workflow {

    // Get the input CSV file from command-line arguments
    if (params.use_query) {
        SYNAPSE_QUERY(params.query)
        GET(SYNAPSE_QUERY.out)
    } else {
        input = Channel.fromFile(params.input_csv)
        GET(input)
    }

    QC(GET.out.fastq_ch)
}
