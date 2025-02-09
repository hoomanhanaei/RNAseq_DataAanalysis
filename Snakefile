from snakemake.utils import min_version

##### set minimum snakemake version #####
min_version("8.8.0")

##### Load configuration file #####
configfile: "config/config.yaml"

##### setup report #####
report: "report/workflow.rst"


# Use values from the config file for input and output directories
input_dir = config['data']['raw_reads']
output_dir = config['out']['out_dir']
genome_fasta = config['ref']['ref_fasta']
# idx = [1, 2, 3, 4, "rev.1", "rev.2"]

# get sample names based on the .fastq files in the input directory
samples, = glob_wildcards(f"{input_dir}/{{sample}}.fastq")

##### load rules #####
include: "rules/all.smk"
include: "rules/fastq2fasta.smk"
include: "rules/indexing.smk"
include: "rules/align.smk"

