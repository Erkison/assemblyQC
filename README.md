# assemblyQC

## Local run
```
nextflow run ~/Ewomazino/Erkison/code/bioinformatics_scripts/massive/assemblyQC/main.nf \
    --assemblies "path/to/assemblies/*.fasta" --output_dir path/to/output/dir \
    -profile local \
    -resume
```

## Massive run
```
nextflow run ~/Ewomazino/Erkison/code/bioinformatics_scripts/massive/assemblyQC/main.nf \
    --assemblies "path/to/assemblies/*.fasta" --output_dir . \
    -profile standard -resume
```