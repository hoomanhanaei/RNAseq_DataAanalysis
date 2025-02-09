# Snakefile

# Load configuration file
configfile: "config.yaml"

# Use values from the config file for input and output directories
input_dir = config["input_dir"]
output_dir = config["output_dir"]
genome_fasta = config["genome_fasta"]
# idx = [1, 2, 3, 4, "rev.1", "rev.2"]

# get sample names based on the .fastq files in the input directory
samples, = glob_wildcards(f"{input_dir}/{{sample}}.fastq")

# Include the other modules
include: "rules/fastq2fasta.smk"
include: "rules/indexing.smk"
include: "rules/align.smk"
include: "rules/all.smk"
