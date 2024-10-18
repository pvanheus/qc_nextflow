process fastqc {
  tag "fastqc"
  conda "bioconda::fastqc"

  input:
    path fastq
  output:
    path "*.html", emit: fastqc_report
    path "*.zip", emit: fastqc_result
  script:
    """
    fastqc ${fastq}
    """
}
