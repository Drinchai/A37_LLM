# Install required packages if not already installed
# install.packages("igraph")
# install.packages("visNetwork")

# Load required libraries
library(igraph)
library(visNetwork)

# Define the genes and themes
genes <- c("MARCH8", "ALAS2", "BCL2L1", "BPGM", "C14ORF45", "C1ORF128", "CA1", "EPB42", "FAM46C", "FECH", "GMPR", "GPR146", "GYPB", "GYPE", "IFIT1L", "KRT1", "NFIX", "OR2W3", "OSBP2", "PLEK2", "SELENBP1", "SLC14A1", "SLC4A1", "SNCA", "TMCC2", "TMOD1", "TNS1", "TRIM10", "TUBB2A", "XK")
themes <- c("Hemoglobin synthesis and red blood cell function", "Apoptosis regulation", "Enzymes and metabolic processes", "Transcription factors and gene regulation", "Olfactory receptors", "Immune response", "Cytoskeletal proteins", "Lipid metabolism and transport", "Unclear functions")

# Add edges between genes and themes
edges <- data.frame(from = character(), to = character(), stringsAsFactors = FALSE)

# Add edges between genes and themes based on functional categories
edges <- rbind(edges,
               data.frame(from = c("ALAS2", "CA1", "EPB42", "FECH", "GYPB", "GYPE", "SLC4A1"),
                          to = rep("Hemoglobin synthesis and red blood cell function", 7), stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = "BCL2L1",
                          to = "Apoptosis regulation", stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = c("BPGM", "FECH", "GMPR"),
                          to = rep("Enzymes and metabolic processes", 3), stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = "NFIX",
                          to = "Transcription factors and gene regulation", stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = "OR2W3",
                          to = "Olfactory receptors", stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = "IFIT1L",
                          to = "Immune response", stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = c("KRT1", "TUBB2A"),
                          to = rep("Cytoskeletal proteins", 2), stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = "OSBP2",
                          to = "Lipid metabolism and transport", stringsAsFactors = FALSE))

edges <- rbind(edges,
               data.frame(from = genes[!genes %in% edges$from],
                          to = rep("Unclear functions", length(genes[!genes %in% edges$from])), stringsAsFactors = FALSE))

# Convert the edges dataframe to a matrix
edges_matrix <- as.matrix(edges)

# Create a graph from the edge list
graph <- graph_from_edgelist(edges_matrix, directed = FALSE)


# Create nodes and edges data.frames for visNetwork
nodes <- data.frame(id = V(graph)$name, label = V(graph)$name, stringsAsFactors = FALSE)
edges_vis <- data.frame(from = edges$from, to = edges$to, stringsAsFactors = FALSE)

# Define node colors based on whether the node is a gene or a theme
nodes$color <- ifelse(nodes$id %in% genes, "lightblue", "orange")

# Define font size for labels
nodes$font.size <- 24

# Visualize the network graph with custom node colors and label font sizes
visNetwork::visNetwork(nodes = nodes, edges = edges_vis) %>% 
  visNodes(
    color = list(
      background = nodes$color,
      border = "black"
    ),
    font = list(size = nodes$font.size)
  )
