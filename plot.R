path = "C:/Users/rohit/Desktop/hgdp"
filename <- "hgdp_chr21"


library(dplyr)
library(ggplot2)
library(data.table)
library(scales)
library(ggfortify)


#%%
setwd(path)

#%%
pca <- fread(paste0(filename, ".pca50.txt"), sep = "\t", header = FALSE, data.table = FALSE)
# tsne <- fread(paste0(filename, ".tsne.txt"), sep = "\t", header = FALSE, data.table = FALSE)
# pca_tsne <- fread(paste0(filename, ".pca50_tsne.txt"), sep = "\t", header = FALSE, data.table = FALSE)
# umap <- fread(paste0(filename, ".umap.txt"), sep = "\t", header = FALSE, data.table = FALSE)
# pca_umap <- fread(paste0(filename, ".pca50_umap.txt"), sep = "\t", header = FALSE, data.table = FALSE)

#%%

psam <- fread("hgdp_chr21.psam", sep = "\t",header = T, data.table = FALSE)
id_psam <- psam[, c(1,3,6)]
#%%

pca1 <- cbind(id_psam, pca) %>% 
  # rename(ID = id_psam, Population = id_psam1, Region = id_psam)
  select( id , population, region, V1, V2)
pca1$population <- factor(pca1$population)
pca1$region <- factor(pca1$region)

# rename(ID = V1, Population = V2, Region = V3) %>%


# tsne1 <- cbind(id_psam, tsne) %>% 
#   rename(ID = V1, Population = V3, Region = V6)
# 
# pca_tsne1 <- cbind(id_psam, pca_tsne) %>% 
#   rename(ID = V1, Population = V3, Region = V6)
# 
# umap1 <- cbind(id_psam, umap) %>% 
#   rename(ID = V1, Population = V3, Region = V6)
# 
# pca_umap1 <- cbind(id_psam, pca_umap) %>% 
#   rename(ID = V1, Population = V3, Region = V6)

# Plot PCA

ggplot(pca1, aes(x = V1, y = V2, color = population, shape = region), alpha = .5) + 
  scale_shape_manual(values = c(0, 1, 2, 3, 4, 5, 6, 7, 8)) +
  labs(x = "Principal Component 1", y = "Principal Component 2", title = paste(filename, "PCA Plot")) + 
  geom_point(size = 2) +
  theme_minimal()


# Plot t-SNE
# tsne11 <- tsne1[, 4:5]
# tsne12 <- scale(tsne11)
# 
# ggplot() + 
#   geom_point(aes(x = tsne12[, 1], y = tsne12[, 2]), color = 'population', alpha = 0.5) + 
#   labs(x = "t-SNE Component 1", y = "t-SNE Component 2", title = paste(filename, "t-SNE Plot of Sample Data")) + 
#   theme_minimal()
# 
# # Plot PCA t-SNE
# pca_tsne11 <- pca_tsne1[, 4:5]
# pca_tsne12 <- scale(pca_tsne11)
# 
# ggplot() + 
#   geom_point(aes(x = pca_tsne12[, 1], y = pca_tsne12[, 2]), color = "blue", alpha = 0.5) + 
#   labs(x = "PCA t-SNE Component 1", y = "PCA t-SNE Component 2", title = paste(filename, "PCA t-SNE Plot of Sample Data")) + 
#   theme_minimal()
# 
# # Plot UMAP
# umap11 <- umap1[, 4:5]
# umap12 <- scale(umap11)
# 
# ggplot() + 
#   geom_point(aes(x = umap12[, 1], y = umap12[, 2]), color = "blue", alpha = 0.5) + 
#   labs(x = "UMAP Component 1", y = "UMAP Component 2", title = paste(filename, "UMAP Plot of Sample Data")) + 
#   theme_minimal()
# 
# # Plot PCA UMAP
# pca_umap11 <- pca_umap1[, 4:5]
# pca_umap12 <- scale(pca_umap11)
# 
# ggplot() + 
#   geom_point(aes(x = pca_umap12[, 1], y = pca_umap12[, 2]), color = "blue", alpha = 0.5) + 
#   labs(x = "PCA UMAP Component 1", y = "PCA UMAP Component 2", title = paste(filename, "PCA UMAP Plot of Sample Data")) + 
#   theme_minimal()
