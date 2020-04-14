
def zeros(representation):
    if type(representation) is tuple:
        rows = representation[0]
        columns = representation[1]
        return [[0] * columns for _ in range(rows)]
    return [0 for _ in range(representation)]
