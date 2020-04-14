from graph import Graph

# aqui necesitaremos una clase node adicional ya que cada nodo contiene 
# un conjunto de sus nodos adjacent 

class Node:
    def __init__(self, vertexId):
        self.vertexId = vertexId
        self.adjacent_set = set()

    def add_edge(self, v):
        if self.vertexId == v:
            raise ValueError("No puedes ingresar un nodo con el mismo id")
        self.adjacent_set.add(v)

    def get_adjacent_vertices(self)
    """No es necesario retornar el conjunto ordenado"""
        return sorted(self.adjacent_set)
