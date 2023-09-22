erythrocyte_dev_func <- c("ALAS2", "BPGM", "EPB42", "GYPB", "GYPE", "SLC4A1", "XK", "FECH")
apoptosis_survival <- c("BCL2L1")
cytoskeleton_structure <- c("TNS1", "TMOD1", "TUBB2A")
ubiquitin_proteasome <- c("MARCH8", "TRIM10")
guanine_metabolism <- c("GMPR")

# Create a dataframe for each category
df_erythrocyte_dev_func <- data.frame(Gene = erythrocyte_dev_func, Theme = "Erythrocyte Development and Function")
df_apoptosis_survival <- data.frame(Gene = apoptosis_survival, Theme = "Apoptosis and Cellular Survival")
df_cytoskeleton_structure <- data.frame(Gene = cytoskeleton_structure, Theme = "Cytoskeleton and Cellular Structure")
df_ubiquitin_proteasome <- data.frame(Gene = ubiquitin_proteasome, Theme = "Ubiquitin-Proteasome System")
df_guanine_metabolism <- data.frame(Gene = guanine_metabolism, Theme = "Guanine Metabolism")

# Combine all dataframes into one
df <- rbind(df_erythrocyte_dev_func, df_apoptosis_survival, df_cytoskeleton_structure, df_ubiquitin_proteasome, df_guanine_metabolism)

# Print the dataframe
print(df)

if (!require("igraph")) install.packages("igraph")

# Load the required library
library(igraph)

# Assume we have a dataframe df with the columns "Gene" and "Theme"

# Create an igraph object from the dataframe
g <- graph_from_data_frame(df, directed=FALSE)

# Set node and edge attributes
V(g)$color <- ifelse(V(g)$name %in% df$Gene, "skyblue", "pink")
V(g)$shape <- ifelse(V(g)$name %in% df$Gene, "circle", "square")
E(g)$color <- "grey"

# Plot the graph
plot(g, vertex.label.dist=1, vertex.size=15)
