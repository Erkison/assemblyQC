process QUAST {
    tag { sample_id }
    time '1h'
    cpus 1
    memory { 4.GB * task.attempt }
        
    publishDir "${params.output_dir}/quast",
        mode: 'copy',
        pattern: "report.tsv",
        saveAs: { file -> "${sample_id}_quast_" + file.split('\\/')[-1] },
        failOnError: true

    input:
    tuple(val(sample_id), path(assembly))

    output:
    path("${sample_id}"), emit: quast_dir
    tuple(val(sample_id), path("report.tsv"), emit: quast_report)


    """
    quast.py ${assembly} -o .
    mkdir ${sample_id}
    ln -s \$PWD/report.tsv ${sample_id}/report.tsv
    """
}


process MULTIQC {
    tag { 'multiqc for quast' }
    cpus 8
    memory { 4.GB * task.attempt }

    publishDir "${params.output_dir}/multiqc",
        mode: 'copy',
        pattern: "multiqc_report.html",
        saveAs: { "quast_multiqc_report.html" }

    publishDir "${params.output_dir}/multiqc",
        mode: 'copy',
        pattern: "multiqc_data/multiqc_quast.txt",
        saveAs: { "quast_multiqc_summary.tsv" }

    input:
    path(quast_files) 

    output:
    path("multiqc_report.html") 
    path("multiqc_data/multiqc_quast.txt") , emit: quast_multiqc_summary

    script:
    """
    multiqc --interactive .
    """
}
