rule all:
    input:
        f"{genome_fasta}.bt2",
        expand(f"{output_dir}/{{sample}}_aligned.bam", sample=samples)