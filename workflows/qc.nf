include { FASTQC } from '../modules/fastqc'
include { MULTIQC } from '../modules/multiqc'

workflow QC {

    take: fastq_ch

    main:
    // Run FASTQC on each .fastq.gz file directly
    FASTQC(fastq_ch)

    FASTQC.out.zip.map { it -> it [1]}.collect().set{ collected }
    
    // Run MultiQC on the collected QC results
    MULTIQC(collected)
}