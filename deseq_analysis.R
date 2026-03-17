library(DESeq2)
library(pheatmap)
library(ggplot2)

counts <- read.table("counts/gene_counts.txt", header=TRUE, row.names=1, comment.char="#")

counts <- counts[,6:ncol(counts)]

condition <- factor(c("control","control","control","treated","treated","treated"))

coldata <- data.frame(row.names=colnames(counts), condition)

dds <- DESeqDataSetFromMatrix(countData=counts,
                              colData=coldata,
                              design=~condition)

dds <- DESeq(dds)

res <- results(dds)

resOrdered <- res[order(res$pvalue),]

res_df <- as.data.frame(resOrdered)

res_df$gene <- rownames(res_df)

# Volcano plot
volcano <- ggplot(res_df, aes(x=log2FoldChange, y=-log10(pvalue))) +
  geom_point(alpha=0.5) +
  theme_minimal()

ggsave("plots/volcano.png", volcano)

# Heatmap
vsd <- varianceStabilizingTransformation(dds)

topGenes <- head(order(rowMeans(counts(dds, normalized=TRUE)), decreasing=TRUE),50)

mat <- assay(vsd)[topGenes,]

pheatmap(mat, filename="plots/heatmap.png")
