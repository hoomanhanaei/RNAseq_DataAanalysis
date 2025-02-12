rule all:
    input:
        f"{output_dir}/index_genome.bt2",
        expand(f"{output_dir}/{{sample}}_aligned.bam", sample=samples)
