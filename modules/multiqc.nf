process MultiQC {
    label 'process_low'  

    container 'ewels/multiqc:1.14'  

    input:
    path qc_results_files

    output:
    path 'multiqc_report.html'

    script:
    """
    multiqc ${qc_results_files} --outdir .
    """
}