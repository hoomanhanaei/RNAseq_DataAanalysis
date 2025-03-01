rule fastqc:
    input:
        fastq = f"{config['rnaseq']['raw_reads']}/{{sample}}.fastq"
    
    output:
        "qc_reports/{sample}_fastqc.html",
        "qc_reports/{sample}_fastqc.zip"
    
    conda:
        "../envs/fastqc.yaml"
    
    shell:
        """
        fastqc --outdir=qc_reports {input}
        """