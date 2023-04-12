include { QUAST; MULTIQC } from '../modules/processes.nf' 

workflow QC {
    take:
        assemblies_ch

    main: 
        QUAST(assemblies_ch)
        QUAST.out.quast_dir.collect().view()
        MULTIQC(QUAST.out.quast_dir.collect())

    emit:
        MULTIQC.out.quast_multiqc_summary
}