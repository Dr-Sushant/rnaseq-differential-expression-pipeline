SAMPLES = ["SRR13696355","SRR13696356","SRR13696357",
           "SRR13696379","SRR13696380","SRR13696381"]

rule all:
    input:
        "plots/volcano.png",
        "plots/heatmap.png"

rule counts:
    input:
        expand("bam/{sample}.bam", sample=SAMPLES)
    output:
        "counts/gene_counts.txt"
    log:
        "logs/counts.log"
    shell:
        "featureCounts -T 8 -a genome/GCA_001949185.1_Rvar_4.0_genomic.gtf -o {output} bam/*.bam &> {log}"

rule deseq:
    input:
        "counts/gene_counts.txt"
    output:
        "plots/volcano.png",
        "plots/heatmap.png"
    log:
        "logs/deseq.log"
    shell:
        "Rscript scripts/deseq_analysis.R &> {log}"
