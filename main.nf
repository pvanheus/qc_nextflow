include { fastqc } from './modules/fastqc.nf';
include { multiqc } from './modules/multiqc.nf';

params.data_dir = null
if (params.data_dir == null) {
    log.info "Please provide a data directory with --data_dir"
    System.exit(1)
}

workflow {

    main:
        fastq_ch =  Channel.fromPath("${params.data_dir}/*.fastq*")
        fastqc_results = fastqc(fastq_ch).fastqc_result
        multiqc_results = multiqc(fastqc_results.collect())
}
