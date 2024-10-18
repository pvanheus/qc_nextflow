process multiqc {
    tag "multiqc"
    conda "bioconda::multiqc"
    cpus 1
    
    publishDir "results/", mode: 'copy'

    input:
        path fastqc_result
    output:
        path "multiqc_report.html", emit: multiqc_report
    script:
        """
        mkdir results
        cp ${fastqc_result} results/
        multiqc results/
        """
}