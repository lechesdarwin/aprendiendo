from graph import Graph


class Node:

    def __init__(self, vertexId):
            self.vertexId = vertexId
            self.adjacent_set = set()

    def add_edge(self, v):
        if self.vertexId == v:
            raise ValueError(f"el verice {v} no puede se adjavente al el mismo")
        self.adjacent_set.add(v)

    def get_adjacent_vertices(self):
        """el retornar el conjunto ordenado no es necesario del todo"""
        return sorted(self.adjacent_set)


class AdjacentSetGraph(Graph):

    def __init__(self, numVertices, directed=False):
        super().__init__(numVertices, directed)
        self.vertex_list = []
    # agragamos los id correspondientes
        for i in range(numVertices):
            self.vertex_list.append(Node(i))

    def add_edge(self, v1, v2, weight=1):
        if v1 >= self.numVertices or v2 >= self.numVertices or v1 < 0 or v2 < 0:
            raise ValueError("JAJA vertex overflow v1=%d , v2=%d " % (v1, v2))
        # vamos hacer un grafo ponderado
        if weight != 1:
            raise ValueError("No se puede tener un peso > 1")
        self.vertex_list[v1].add_edge(v2)
        if self.directed is False:
            self.vertex_list[v2].add_edge(v1)

    def get_adjacent_vertices(self, v):
        if v < 0 or v >= self.numVertices:
            raise ValueError("Cannot acces to vertex %d " % v)
        return self.vertex_list[v].get_adjacent_vertices()

    def get_indegree(self, v):
        if v < 0 or v >= self.numVertices:
            raise ValueError("Cannot acces vertex %d" % d)
        indegree = 0
        for i in range(self.numVertices):
            if v in self.get_adjacent_vertices(i):
                indegree = indegree + 1
        return indegree

    def get_edge_weight(self, v1, v2):
        """ como es un grafo ponderado """
        return 1

    def display(self):
        for i in range(self.numVertices):
            for v in self.get_adjacent_vertices(i):
                print(i, "-->", v)
