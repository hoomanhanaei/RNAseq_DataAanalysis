rule index:
    input:
        f"{genome_fasta}/SRR11945687_1.fasta"
    output:
        f"{genome_fasta}.bt2"
    conda:
        "envs/bowtie2.yaml"
    shell:
        """
        bowtie2-build {input} {output}
        """