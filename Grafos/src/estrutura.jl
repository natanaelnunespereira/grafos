export Vertice, Aresta, Grafo

# Estrutura que simboliza um vertice, o vertice possui id e um rotulo.
struct Vertice
    id::Int
    rotulo::String
end

# Estrutura que simboliza uma aresta, uma aresta possui dois vertices e um peso.
struct Aresta
    verticeA::Vertice
    verticeB::Vertice
    peso::Float64

    # Construtores, pois o peso é opcional.
    Aresta(args...) = new(args...)
    Aresta(verticeA, verticeB) = new(verticeA, verticeB)
end

# Estrutura que simboliza um grafo, ele possui vertices e arestas.
struct Grafo
    vertices::Vector{Vertice}
    arestas::Vector{Aresta}
end