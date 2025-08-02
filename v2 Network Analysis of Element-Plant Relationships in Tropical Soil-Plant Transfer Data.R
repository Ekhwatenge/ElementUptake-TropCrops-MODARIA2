# Install required packages if not already installed
if (!require("tidygraph")) install.packages("tidygraph")
if (!require("ggraph")) install.packages("ggraph")

library(tidyverse)
library(igraph)
library(tidygraph)
library(ggraph)

# Assuming you've already built 'edges' and 'nodes' as before.

# 1. Build tidygraph object
g_tidy <- tbl_graph(nodes = nodes, edges = edges, directed = FALSE)

# 2. Plot using ggraph
set.seed(42)
ggraph(g_tidy, layout = 'bipartite') +  # Try layout = 'kk' for force-directed
  geom_edge_link(aes(width = weight), alpha = 0.8, color = "grey40") +
  geom_node_point(aes(color = type), size = 5) +
  geom_node_text(aes(label = name), repel = TRUE, size = 3) +
  scale_edge_width(range = c(0.5, 3)) +
  scale_color_manual(values = c("tomato", "steelblue"), labels = c("Element", "Plant")) +
  theme_graph() +
  labs(title = "Element-Plant Bipartite Network", edge_width = "Mean CR") +
  theme(legend.position = "bottom")
