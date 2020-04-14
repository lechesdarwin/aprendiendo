from queue import Queue
from graph import *


def topological_sort(graph: Graph):
    queue = Queue()
    indegreeMap = {}
    for i in range(graph.numVertices):
        indegreeMap[i] = graph.get_indegree(i)

        # queue todos los nodos que no tienen dependencias
        # sin bordes entrando
        if indegreeMap[i] == 0:
            queue.put(i)

    sorted_list = []
    while not queue.empty():
        vertex = queue.get()

        sorted_list.append(vertex)
        for v in graph.get_adjacent_vertices(vertex):
            indegreeMap[v] = indegreeMap[v] - 1
            if indegreeMap[v] == 0:
                queue.put(v)
    if len(sorted_list) != graph.numVertices:
        raise ValueError("This graph has cicle")
    print(sorted_list)
