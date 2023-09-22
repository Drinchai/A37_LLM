# Import required packages
library(igraph)

# Defining the nodes and edges data
# This is a simplified version and you'll need to update this with actual data
nodes <- data.frame(id = c('ANKRD9', 'E2F2', 'FHL2', 'MAP2K3', 'MARCH2', 'PPM1A', 'TMEM158', 'UBE2H', 
                           'Cell Cycle Regulation', 'Protein Degradation', 'Signal Transduction', 'Apoptosis'),
                    type = c(rep('Gene', 8), rep('Theme', 4)))

edges <- data.frame(from = c('ANKRD9', 'E2F2', 'FHL2', 'MAP2K3', 'MARCH2', 'PPM1A', 'TMEM158', 'UBE2H', 
                             'E2F2', 'MAP2K3', 'PPM1A', 'TMEM158', 'UBE2H', 'FHL2', 'MAP2K3', 'MARCH2', 'PPM1A', 'TMEM158', 'UBE2H'),
                    to = c(rep('Cell Cycle Regulation', 4), rep('Protein Degradation', 4), rep('Signal Transduction', 5), rep('Apoptosis', 6)))

# Creating the graph object
graph <- graph_from_data_frame(edges, vertices=nodes, directed=F)

# Setting the attributes for nodes and edges
V(graph)$color <- ifelse(V(graph)$type == "Gene", "lightblue", "lightgreen")
V(graph)$shape <- ifelse(V(graph)$type == "Gene", 'circle', 'square')
V(graph)$size <- ifelse(V(graph)$type == "Gene", 10, 15)
E(graph)$color <- 'gray'
E(graph)$arrow.size <- 0.5

# Plotting the graph
plot(graph, vertex.label.dist=0.5, edge.arrow.size=.5, edge.curved = 0.2, 
     main = "Gene-Theme Network", sub="Nodes represent genes and themes, edges represent associations")
