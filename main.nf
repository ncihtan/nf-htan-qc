nextflow.enable.dsl=2


include {GET} from './workflows/get.nf'
include { QC } from './workflows/qc.nf'

workflow {
    // Get the input CSV file from command-line arguments
    input_csv = params.input_csv ?: 'input.csv'

    GET(input_csv)
    QC(GET.out.fastq_ch)
}
