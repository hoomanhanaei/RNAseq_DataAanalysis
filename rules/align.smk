rule align:
    input:
        fastq = f"{input_dir}/{{sample}}.fastq",
        index = f"{genome_fasta}.bt2"
    output:
        f"{output_dir}/{{sample}}_aligned.bam"
    conda:
        "envs/tophat2.yaml"
    shell:
        """
        tophat -o "{output_dir}/{wildcards.sample}_tophat2_output" 
        -G reference/genes.gtf {input.index} {input.fastq}
        """