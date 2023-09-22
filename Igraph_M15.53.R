# Install necessary package
install.packages("igraph")
library(igraph)

# Define nodes
themes <- c("Signal_Transduction", "Protein_Modification", "Transport", "Structure", "Transcription", "Enzyme_Function", "Cellular_Processes", "Less_Characterized")
genes <- c("BRD4", "C16ORF35", "CDKL1", "DPM2", "EPB41", "HMBS", "HPS1", "IQWD1", "KLC3", "LOC643008", "LOC648434", "LOC650898", "MAP2K3", "MICAL2", "MICALCL", "MXI1", "RAB3IL1", "RP11-529I10.4", "SLC38A5", "SLC6A8", "TCP11L2", "TGM2", "TMPRSS9", "TTC25", "WNK1", "TMEM183A", "TMEM183B", "UBE2F", "UBQLN1", "WBP2", "WDR26", "WDR45", "WDR51B", "ZBTB44", "ZER1", "ZNF653")
nodes <- c(themes, genes)

# Define edges - this is a simplified and illustrative example
# The edges should be defined based on known biological interactions or associations
edges <- c("Signal_Transduction", "BRD4",
           "Signal_Transduction", "CDKL1",
           "Signal_Transduction", "MXI1",
           "Signal_Transduction", "WNK1",
           "Signal_Transduction", "ZBTB44",
           "Protein_Modification", "TGM2",
           "Protein_Modification", "TMPRSS9",
           "Protein_Modification", "UBE2F",
           "Protein_Modification", "UBQLN1",
           "Protein_Modification", "ZER1",
           "Transport", "SLC38A5",
           "Transport", "SLC6A8",
           "Transport", "RAB3IL1",
           "Transport", "WNK1",
           "Structure", "EPB41",
           "Structure", "TTC25",
           "Structure", "TMEM183A",
           "Structure", "TMEM183B",
           "Transcription", "ZBTB44",
           "Transcription", "ZNF653",
           "Enzyme_Function", "HMBS",
           "Enzyme_Function", "DPM2",
           "Cellular_Processes", "WBP2",
           "Cellular_Processes", "WDR26",
           "Cellular_Processes", "WDR45",
           "Cellular_Processes", "WDR51B",
           "Less_Characterized", "C16ORF35",
           "Less_Characterized", "HPS1",
           "Less_Characterized", "IQWD1",
           "Less_Characterized", "KLC3",
           "Less_Characterized", "LOC643008",
           "Less_Characterized", "LOC648434",
           "Less_Characterized", "LOC650898",
           "Less_Characterized", "MICAL2",
           "Less_Characterized", "MICALCL",
           "Less_Characterized", "RP11-529I10.4")

# Create graph object
graph <- graph_from_edgelist(matrix(edges, ncol = 2, byrow = TRUE), directed = FALSE)
plot(graph, vertex.size = 10, vertex.label.cex = 0.8)
