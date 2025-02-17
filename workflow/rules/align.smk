rule align:
    input:
        fastq = f"/home/hooman/data/sra_data/mus_musculus/RNAseq_ma_macrophages/subseted/subseted_2h_Reperfusion_1.fastq",
        index = f"{config['out']['out_dir']}",
        annot = f"{config['ref']['annotation']}"

    output:
        f"{config['out']['out_dir']}/subseted_2h_Reperfusion_1_aligned.bam"

    conda:
        "../envs/tophat2.yaml"
    
    params:
        out_dir = f"{config['out']['out_dir']}/tophat2_output"

    shell:
        """
        tophat2 -o {params.out_dir} -G {input.annot} {input.index} {input.fastq}
        """