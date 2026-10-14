# Social Network Analysis: Connections Between Government Officials and Business People



**Problem**

This project applies Social Network Analysis (SNA) in R to examine connections 
between government officials and businesspeople through their shared 
associations with firms.

The dataset represents a fictional country called **Zebra**. The aim is to 
construct and visualise a network, calculate centrality measures, and identify 
individuals who occupy highly connected or potentially influential positions 
within the network.



**Dataset**

The project uses `network_dataset1.csv`, a mock dataset representing 
relationships between government officials and businesspeople in the fictional 
country of Zebra.

The dataset contains three variables:

- **`name`:** The name of each individual in the network.
- **`firm`:** The firm with which an individual is associated.
- **`category`:** The individual's category, distinguishing government 
officials from businesspeople.

Individuals associated with the same firm are connected in the network. 
The dataset is intended for educational purposes and does not represent 
verified relationships in a real country.



**Methods**

- Imported the dataset into R using `read_csv()`.
- Selected unique combinations of individuals and firms.
- Used joins and filtering to identify individuals associated with the 
same firm.
- Constructed an undirected network using `igraph`.
- Calculated **degree centrality** to examine the number of direct connections 
held by each individual.
- Calculated **betweenness centrality** to identify individuals who may connect 
different parts of the network.
- Sorted centrality results to identify individuals with the highest values.
- Created a network visualisation using different colours for government 
officials and businesspeople.
- Used node sizes to represent degree centrality and added labels and a legend 
to distinguish network members; added the node with the greatest sizes at the 
centre.



**Tools**

- **R and RStudio:** Data preparation, analysis, and reporting.
- **`tidyverse`:** Data manipulation and inspection.
- **`dplyr`:** Selecting, joining, filtering, and organising records.
- **`igraph`:** Network construction, centrality calculations, and 
visualisation.
- **R Markdown:** Documenting the analysis and generating a reproducible HTML 
report.



**Key Insights and Outcomes**

The analysis identified **Secretary_007** as the individual with the highest 
degree centrality in the reported results, indicating that they had the greatest
number of direct connections in the constructed network.

**Director_General_005** had the highest betweenness centrality in the reported 
results, suggesting that they occupied a potentially important connecting 
position between individuals or groups.

The network visualisation distinguishes government officials from 
business people, making it easier to examine connections between the two 
categories through shared firms.

These findings describe the structure of the fictional dataset. 
Centrality measures indicate network positions but do not, on their own, 
establish real-world influence, misconduct, or causation.



**Project Outputs**

- **HTML report:** `gugulethu_mkhize_sna.html`, containing the knitted analysis 
and visualisation.
- **R Markdown source:** The source document used to generate the report.
- **R script:** `gugulethu_mkhize_sna.R`, once successfully extracted from the 
R Markdown document.
- **Dataset:** `network_dataset1.csv`, containing the individual, firm, and 
category information.
- **Network graph:** `gugulethu_sna_.png`, the separate PNG export.
- **README:** Describing the project's purpose, methods, and outcomes.



**Reproducibility**

To reproduce the analysis, ensure that R and RStudio are installed and that 
`network_dataset1.csv` is available in the project directory.

Install the required packages:

```r
install.packages(c("tidyverse", "igraph", "dplyr"))
```

Load the packages and import the dataset:

```r
library(tidyverse)
library(igraph)
library(dplyr)

network_data <- read_csv("network_dataset1.csv")
```

Run the remaining data preparation, network construction, centrality 
calculations, and visualisation code in sequence.

The network layout uses `set.seed(338)` to support reproducibility when the 
dataset and code remain unchanged.




