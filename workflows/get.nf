include { SYNAPSE_GET } from "../modules/synapse_get.nf"

workflow GET {
    take:
    samplesheet
    main:
    Channel
        .fromPath(samplesheet)
        .splitCsv (header:true, sep:',' )
        .branch {
            row ->
            syn: row.fastq =~ /syn\d+/
            other: true
            }
        .set{ branched }

        // Make meta map from the samplesheet where local
        branched.other
        .map {
            row ->
            def meta = [:]
            meta.id = file(row.fastq).simpleName
            def fastq = file(row.fastq)
            [meta, fastq]
        }
        .set {other }

        /// Where is a synapse ID fetch with synapse_get
        branched.syn
        .map {
            row ->
            def meta = [:]
            meta.id = row.fastq
            meta
        }.set{ syn }

        SYNAPSE_GET(syn)
            .mix(other)
            .set{ fastq_ch }

    emit:
        fastq_ch
}