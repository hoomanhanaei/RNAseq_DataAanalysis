# Rule to convert FASTQ to FASTA.
rule fastq_to_fasta:
    input:
        fastq = f"{genome_fasta}/SRR11945687_1.fastq"
    output:
        fasta = f"{genome_fasta}/SRR11945687_1.fasta"
    conda:
        "envs/seqtk.yaml"
    shell:
        "seqtk seq -A {input.fastq} > {output.fasta}"