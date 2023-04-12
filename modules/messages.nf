def help_message() {
  log.info """
        Usage:
        The typical command for running the pipeline is as follows:
        nextflow run main.nf --assemblies "path_to_assemblies/*.fasta" --output_dir <output_dir>  
        Mandatory arguments:
         --assemblies                   Query fasta file of sequences you wish to supply as input (e.g., "data/assemblies/*.fasta")
         --output_dir                   Output directory to place output files (e.g., "data/assembly_QC")
        Optional arguments:
         --help                         This usage statement
         --version                      Version statement
        """
}


def version_message(String version) {
      println(
            """
            =========================================================================================
             assemblyQC pipeline - Assess quality of raw assemblies: ${version}
            =========================================================================================
            """.stripIndent()
        )
}

def pipeline_start_message(String version, Map params){
    log.info "=========================================================================================="
    log.info " assemblyQC pipeline - Assess quality of raw assemblies: ${version}"
    log.info "=========================================================================================="
    log.info "Running version   : ${version}"
    log.info "Fasta inputs      : ${params.assemblies}"
    log.info ""
    log.info "-------------------------- Other parameters ----------------------------------------------"
    params.sort{ it.key }.each{ k, v ->
        if (v){
            log.info "${k}: ${v}"
        }
    }
    log.info "=========================================================================================="
    log.info "Outputs written to path '${params.output_dir}'"
    log.info "=========================================================================================="

    log.info ""
}

def complete_message(Map params, nextflow.script.WorkflowMetadata workflow, String version){
    // Display complete message
    log.info ""
    log.info "Ran the workflow: ${workflow.scriptName} ${version}"
    log.info "Command line    : ${workflow.commandLine}"
    log.info "Completed at    : ${workflow.complete}"
    log.info "Duration        : ${workflow.duration}"
    log.info "Success         : ${workflow.success}"
    log.info "Work directory  : ${workflow.workDir}"
    log.info "Exit status     : ${workflow.exitStatus}"
    log.info "Thank you for using the assemblyQC pipeline!"
    log.info ""
}

def error_message(nextflow.script.WorkflowMetadata workflow){
    // Display error message
    log.info ""
    log.info "Workflow execution stopped with the following message:"
    log.info "  " + workflow.errorMessage
}