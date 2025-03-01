rule multiqc:
    input:
        expand("qc_reports/{sample}_fastqc.zip", sample=samples)
    
    output:
        "qc_reports/multiqc_report.html"
    
    conda:
        "../envs/multiqc.yaml"
    
    shell:
        """
        multiqc {input} --outdir qc_reports
        """