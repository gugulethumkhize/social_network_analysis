## ----message=FALSE, warning=FALSE----------------------------
library(tidyverse)
library(igraph)
library(dplyr)



## ----message=FALSE, warning=FALSE----------------------------

network_data <- read_csv("network_dataset1.csv") 

head(network_data)

colnames(network_data)



## ------------------------------------------------------------
people_firms <- network_data %>%
dplyr::select(name, firm) %>%
distinct()

head(people_firms, 10)

people_firms



## ----warning=FALSE, message=FALSE----------------------------

edge_list <- people_firms %>%
inner_join(people_firms, by = "firm") %>%
dplyr::filter(name.x != name.y) %>%
dplyr::select(name.x, name.y)

head(edge_list,10)



## ------------------------------------------------------------
g_people <- graph_from_data_frame(edge_list, directed = FALSE)

cat("\nSummary of the Created Graph:\n")
print(g_people)


## ------------------------------------------------------------
degree_centrality <- degree(g_people)
degree_centrality <- degree(g_people) %>% 
data.frame(name = names(degree_centrality),
degree = degree_centrality) %>%
arrange(desc(degree))

head(degree_centrality)



## ------------------------------------------------------------
betweenness_centrality <- betweenness(g_people)
betweenness_centrality <- betweenness(g_people) %>% 
data.frame(name = names(betweenness_centrality),
betweenness = betweenness_centrality
) %>%
arrange(desc(betweenness))

head(betweenness_centrality)



## ------------------------------------------------------------


V(g_people)$color <- if_else(
  network_data$category[
    match(V(g_people)$name, network_data$name)
  ] == "government_official",
  "#4DAF4A",  
  "#D95F02"   
)

g_people <- simplify(
  g_people,
  remove.loops = TRUE,
  edge.attr.comb = "sum"
)



## ------------------------------------------------------------

set.seed(338)
random_layout <- layout_randomly(g_people)
random_layout <- random_layout*3
degree<- degree(g_people, mode = "all")



## ------------------------------------------------------------

fr_layout <- layout_with_fr(g_people)

node_degrees <- degree(g_people)

par(mar = c(1, 1, 1,1))

plot(g_people,
layout = random_layout, 
vertex.label = V(g_people)$name, 
vertex.label.cex = 0.3, 
vertex.label.color = "black", 
vertex.color = V(g_people)$color, 
vertex.frame.color = "white", 
vertex.size = degree*1.5, 
edge.width = 0.3, 
edge.color = "gray30", 
edge.lty = 1, 
main = "Connections between Government Officials and Business People",
margin = 0.1) 


legend(
  "topright",
  legend = c("Government Officials", "Business People"),
  col = c("#4DAF4A", "#D95F02"),
  pch = 19,
  pt.cex = 1,
  cex = 0.7,
  title = "Legend",
  title.font = 2,
  bty = "o",
  box.lwd = 0.3,
  inset = 0.02
)




## ----export-png, warning=FALSE, message=FALSE----------------

png(
  filename = "gugulethu_sna_network.png",
  width = 2400,
  height = 1800,
  res = 300
)

par(mar = c(1, 1, 3, 1))

plot(
  g_people,
  layout = random_layout,
  vertex.label = V(g_people)$name,
  vertex.label.cex = 0.5,
  vertex.label.color = "black",
  vertex.color = V(g_people)$color,
  vertex.frame.color = "white",
  vertex.size = degree * 1.5,
  edge.width = 0.3,
  edge.color = "gray30",
  edge.lty = 1,
  main = "Connections between Government Officials and Business People",
  margin = 0.1
)

legend(
  "topright",
  legend = c("Government Officials", "Business People"),
  col = c("#4DAF4A", "#D95F02"),
  pch = 19,
  pt.cex = 1.5,
  cex = 1,
  title = "Legend",
  bty = "o",
  inset = 0.02
)

dev.off()

