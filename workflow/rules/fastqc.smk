rule fastqc:
    input:
        fastq = f"{config['rnaseq']['raw_reads']}/{{sample}}.fastq"
    
    output:
        f"{config['out']['outdir']}/qc_reports/{{sample}}_fastqc.html",
        f"{config['out']['outdir']}/qc_reports/{{sample}}_fastqc.zip"
    
    conda:
        "../envs/fastqc.yaml"
    
    params:
        outdir = f"{config['out']['outdir']}/qc_reports/"
    
    shell:
        """
        fastqc --outdir={params.outdir} {input}
        """