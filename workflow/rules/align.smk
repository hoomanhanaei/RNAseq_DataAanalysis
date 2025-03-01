rule align:
    input:
        fastq = f"{config['rnaseq']['raw_reads']}/{{sample}}.fastq",
        index = f"{config['out']['out_dir']}",
        annot = f"{config['ref']['annotation']}"

    output:
        f"{config['out']['out_dir']}/{{sample}}_aligned.bam"

    conda:
        "../envs/tophat2.yaml"
    
    params:
        out_dir = f"{config['out']['out_dir']}/tophat2_output/{{sample}}"

    shell:
        """
        tophat2 -o {params.out_dir} -G {input.annot} {input.index}/genome_index {input.fastq}
        """