rule multiqc:
    input:
        expand(f"{config['out']['outdir']}/qc_reports/{{sample}}_fastqc.zip", sample=samples)
    
    output:
        f"{config['out']['outdir']}/qc_reports/multiqc_report.html"
    
    conda:
        "../envs/multiqc.yaml"
    
    params:
        outdir = f"{config['out']['outdir']}/qc_reports/"

    shell:
        """
        multiqc {input} --outdir {params.outdir}
        """