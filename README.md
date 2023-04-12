# assemblyQC

## Local run
```
nextflow run ~/Ewomazino/Erkison/code/bioinformatics_scripts/massive/assemblyQC/main.nf \
    --assemblies "path/to/assemblies/*.fasta" --output_dir path/to/output/dir \
    -profile local \
    -resume
```

## MASSIVE run
```
nextflow run ~/js66_scratch/erkison/seroepi/scripts/nextflow/assemblyQC/main.nf \
    --assemblies "path/to/assemblies/*.fasta" --output_dir path/to/output/dir \
    -profile standard -resume
```