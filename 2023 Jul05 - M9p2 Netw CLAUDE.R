# Load libraries 
library(igraph)
library(ggraph)

# Create nodes
genes <- c("ALAS2", "BCL2L1", "BPGM", "C14ORF45", "C1ORF128", "CA1", "EPB42", "FAM46C",  
           "FECH", "GMPR", "GPR146", "GYPB", "GYPE", "IFITL1", "KRT1", "MARCH8",  
           "NFIX", "OR2W3", "OSBP2", "PLEK2", "SELENBP1", "SLC14A1", "SLC4A1",  
           "SNCA", "TMCC2", "TMOD1", "TNS1", "TRIM10", "TUBB2A", "XK")
gene_nodes <- data.frame(name=genes, label=genes, type="Gene")   

themes <- c("Erythrocyte biology", "Cytoskeleton", "Protein regulation",  
            "Phospholipid metabolism", "Cell signaling", "Interferon response")
theme_nodes <- data.frame(name=themes, label=themes, type="Theme")

nodes <- rbind(gene_nodes, theme_nodes)

# Create edges
edges <- data.frame(from="ALAS2", to="Erythrocyte biology", relation="involved in")   
edges <- rbind(edges, data.frame(from="FECH", to="Erythrocyte biology", relation="involved in"))   
edges <- rbind(edges, data.frame(from="SLC4A1", to="Erythrocyte biology", relation="involved in"))

edges <- rbind(edges, data.frame(from="EPB42", to="Cytoskeleton", relation="involved in"))
edges <- rbind(edges, data.frame(from="KRT1", to="Cytoskeleton", relation="involved in"))  
edges <- rbind(edges, data.frame(from="TMOD1", to="Cytoskeleton", relation="involved in"))
edges <- rbind(edges, data.frame(from="TNS1", to="Cytoskeleton", relation="involved in")) 
edges <- rbind(edges, data.frame(from="TUBB2A", to="Cytoskeleton", relation="involved in"))

edges <- rbind(edges, data.frame(from="MARCH8", to="Protein regulation", relation="involved in"))     
edges <- rbind(edges, data.frame(from="TRIM10", to="Protein regulation", relation="involved in"))

edges <- rbind(edges, data.frame(from="OSBP2", to="Phospholipid metabolism", relation="involved in"))    
edges <- rbind(edges, data.frame(from="PLEK2", to="Phospholipid metabolism", relation="involved in")) 

edges <- rbind(edges, data.frame(from="GPR146", to="Cell signaling", relation="involved in"))   
edges <- rbind(edges, data.frame(from="SNCA", to="Cell signaling", relation="involved in"))  

edges <- rbind(edges, data.frame(from="IFITL1", to="Interferon response", relation="involved in"))
edges <- rbind(edges, data.frame(from="SELENBP1", to="Interferon response", relation="involved in"))

# Create graph and plot
       gr <- graph_from_data_frame(edges, directed = TRUE, vertices = nodes)
       ggraph(gr, layout = "nicely") +    
         geom_node_point(aes(color = type), size = 5) +
         geom_node_text(aes(label = name), vjust = 1.5, hjust = 0.5) +    
         geom_edge_link(arrow = arrow(length = unit(0.3, "inches"))) + 
         theme_void()       
       