using Graphs, BenchmarkTools

println("=== Construction ===")

print("complete(100):          ")
@btime complete_graph(100)

print("grid_2d(100,100):       ")
@btime grid([100, 100])

function from_edges_path(n)
    g = SimpleGraph(n)
    for i in 1:(n-1)
        add_edge!(g, i, i+1)
    end
    g
end

print("from_edges_100:         ")
@btime from_edges_path(100)

print("from_edges_10000:       ")
@btime from_edges_path(10000)

println("\n=== Query (K200) ===")

g200 = complete_graph(200)

print("has_edge:               ")
@btime has_edge($g200, 51, 151)

print("neighbors:              ")
@btime neighbors($g200, 51)

print("neighbors iterate sum:  ")
@btime sum(neighbors($g200, 51))

print("degree_sequence:        ")
@btime sort(degree($g200))

println("\n=== Algorithms (grid 100x100) ===")

gg = grid([100, 100])

print("bfs (full traversal):   ")
@btime bfs_tree($gg, 1)

print("connected_components:   ")
@btime connected_components($gg)

print("dfs (full traversal):   ")
@btime dfs_tree($gg, 1)

print("shortest_paths (dijkstra): ")
@btime dijkstra_shortest_paths($gg, 1)

print("shortest_paths (bfs):   ")
@btime gdistances($gg, 1)

println("\n=== Edge Iteration (grid 100x100) ===")

print("edges count:            ")
@btime ne($gg)

print("edges iterate:          ")
@btime begin s=0; for e in edges($gg); s += src(e); end; s end
