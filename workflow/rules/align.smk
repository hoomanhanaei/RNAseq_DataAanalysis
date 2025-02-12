rule align:
    input:
        fastq = f"{input_dir}/{{sample}}.fastq",
        index = f"{output_dir}/index_genome/",
        annot = f"{gtf}"
    output:
        f"{output_dir}/{{sample}}_aligned.bam"
    conda:
        "../envs/tophat2.yaml"
    shell:
        """
        tophat2 -o "{output_dir}/{wildcards.sample}_tophat2_output" 
        -G {input.annot} {input.index} {input.fastq}
        """