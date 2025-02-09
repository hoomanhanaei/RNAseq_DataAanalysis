rule index:
    input:
        ref = f"{genome_fasta}/SRR11945687_1.fasta"
    output:
        directory("index_genomecd")
    conda:
        "envs/bowtie2.yaml"
    shell:
        """
        bowtie2-build {ref} {output}
        """