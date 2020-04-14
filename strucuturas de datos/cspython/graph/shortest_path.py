from queue import Queue
from graph import Graph
from adjacentset import *


def build_distance_table(graph: Graph, source):
    # un diccionario mapping from el vertex number to tuple
    # (distance to source , last vertex on path from source)
    distance_table = dict()

    for i in range(graph.numVertices):
        distance_table[i] = (None, None)

    distance_table[source] = (0, source)

    queue = Queue()
    queue.put(source)
    while not queue.empty():
        current_vertex = queue.get()

        # la distancia del vertex current from the source
        current_distance = distance_table[current_vertex][0]
        # chequeamos si ya vicitamos al vecino
        for neighbor in graph.get_adjacent_vertices(current_vertex):
            if distance_table[neighbor][0] is None:
                distance_table[neighbor] = (1 + current_distance, current_vertex)
                if len(graph.get_adjacent_vertices(neighbor)) > 0:
                    queue.put(neighbor)
    return distance_table


def shortest_path(graph, source, destination):
    distance_table = build_distance_table(graph, source)

    # path = [destination]
    # sctack implementacion
    path = [destination]

    previos_vertex = distance_table[destination][1]

    while previos_vertex is not None and previos_vertex is not source:
        path = [previos_vertex] + path
        # path.append(path)
        previos_vertex = distance_table[previos_vertex][1]
    if previos_vertex is None:
        print("There is no path from %d to %d" % (source, destination))
    else:
        path = [source] + path
        print("El camino mas corto es: ", path)


# print de path
g = AdjacentSetGraph(8, directed=True)
g.add_edge(0, 1)
g.add_edge(1, 2)
g.add_edge(1, 3)
g.add_edge(2, 3)
g.add_edge(1, 4)
g.add_edge(3, 5)
g.add_edge(5, 4)
g.add_edge(3, 6)
g.add_edge(6, 7)
g.add_edge(0, 7)

shortest_path(g, 0, 5)
shortest_path(g, 0, 6)
shortest_path(g, 7, 4)
