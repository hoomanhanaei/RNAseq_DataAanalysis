# Snakefile

# Load configuration file
configfile: "config.yaml"

# Use values from the config file for input and output directories
input_dir = config["input_dir"]
output_dir = config["output_dir"]
genome_fasta = config["genome_fasta"]
idx = [1, 2, 3, 4, "rev.1", "rev.2"]

# get sample names based on the .fastq files in the input directory
samples, = glob_wildcards(f"{input_dir}/{{sample}}.fastq")



rule all:
    input:
        f"{genome_fasta}.bt2",
        expand(f"{output_dir}/{{sample}}_aligned.bam", sample=samples)
        



rule index:
    input:
        genome_fasta
    output:
        f"{genome_fasta}.bt2"
    conda:
        "envs/bowtie2.yaml"
    shell:
        """
        bowtie2-build {input} {genome_fasta}
        """



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
        tophat -o {output_dir}/{wildcards.sample}_tophat2_output 
        -G reference/genes.gtf {input.index} {input.fastq}
        """

