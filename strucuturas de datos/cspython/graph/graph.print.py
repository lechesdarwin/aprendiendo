
from graph import *
from adjacentset import AdjacentSetGraph
# g = AdjacentMatrixGraph(4)
g = AdjacentSetGraph(4)

g.add_edge(0, 1)
g.add_edge(0, 2)
g.add_edge(2, 3)

for i in range(4):
    print("Adjacent to: ", i, g.get_adjacent_vertices(i))

for i in range(4):
    print("Indegree: ", i, g.get_indegree(i))
for i in range(4):
    for j in g.get_adjacent_vertices(i):
        print("Edge peso: ", i, " ", j, "peso: ", g.get_edge_weight(i,j))

g.display()
