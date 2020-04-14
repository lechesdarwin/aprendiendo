def merge_sort(S):
    n = len(S)
    if n < 2:
        # esta solo dos items
        return
    mid = len(S)//2
    S1 = S[:mid]
    S2 = S[mid:n]
    merge_sort(S1)
    merge_sort(S2)
    
    merge(S1,S2,S)


