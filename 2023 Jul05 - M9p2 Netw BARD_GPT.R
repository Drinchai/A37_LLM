library(igraph)

# Create a list of genes and themes
genes <- c("ALAS2", "BCL2L1", "BPGM", "C14ORF45", "C1ORF128", "CA1", "EPB42", "FAM46C", "FECH", "GMPR", "GPR146", "GYPB", "GYPE", "IFITL1", "KRT1", "MARCH8", "NFIX", "OR2W3", "OSBP2", "PLEK2", "SELENBP1", "SLC14A1", "SLC4A1", "SNCA", "TMCC2", "TMOD1", "TNS1", "TRIM10", "TUBB2A", "XK")
themes <- c("Erythrocyte biology", "Heme metabolism", "Antioxidant defense", "G protein-coupled receptors", "Solute carrier genes", "Parkinson's disease")

# Create a list of edges that connect genes to themes
edges <- c("ALAS2" = "Heme metabolism", "BCL2L1" = "Antioxidant defense", "BPGM" = "Antioxidant defense", "C14ORF45" = "Erythrocyte biology", "C1ORF128" = "Erythrocyte biology", "CA1" = "Erythrocyte biology", "EPB42" = "Erythrocyte biology", "FAM46C" = "G protein-coupled receptors", "FECH" = "Heme metabolism", "GMPR" = "Solute carrier genes", "GPR146" = "G protein-coupled receptors", "GYPB" = "Antioxidant defense", "GYPE" = "Antioxidant defense", "IFITL1" = "Erythrocyte biology", "KRT1" = "Erythrocyte biology", "MARCH8" = "Erythrocyte biology", "NFIX" = "Erythrocyte biology", "OR2W3" = "G protein-coupled receptors", "OSBP2" = "Solute carrier genes", "PLEK2" = "Erythrocyte biology", "SELENBP1" = "Antioxidant defense", "SLC14A1" = "Solute carrier genes", "SLC4A1" = "Solute carrier genes", "SNCA" = "Parkinson's disease", "TMCC2" = "Solute carrier genes", "TMOD1" = "Solute carrier genes", "TNS1" = "Solute carrier genes", "TRIM10" = "Solute carrier genes", "TUBB2A" = "Solute carrier genes", "XK" = "Solute carrier genes")

# Create a list of vertex labels
vertex_labels <- list(genes, themes)

# Create a network of genes and themes
net <- graph(edges=edges, directed=FALSE)

# Add edge labels to the network
E(net)$label <- "functional association"

# Add vertex labels to the network
for (i in 1:6) {
  V(net)$label[i] <- vertex_labels[[i]]
}

# Plot the network
plot(net, vertex.label=V(net)$label, vertex.size=20, edge.arrow.size=0.1)
