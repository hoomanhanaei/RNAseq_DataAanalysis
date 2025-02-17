rule index:
    input:
        ref = config["ref"]["ref_fasta"]
    
    output:
        expand(f"{config['out']['out_dir']}/genome_index.{{i}}.bt2", i=config["index_files"])
    
    conda:
        "../envs/bowtie2.yaml"
    
    params:
        prefix = f"{config['out']['out_dir']}/genome_index",
        bmax = config["bowtie2_bmax"]
    
    threads: 1

    shell:
        """
        bowtie2-build --threads {threads} --bmax {params.bmax} \
        {input.ref} {params.prefix}
        """