export adjacentes, listaAdjacente, matrizAdjacencia, matrizIncidencia, ordemGrafo, tamanhoGrafo, vizinhanca, vizinhancas, calcularGrauVertice

# Função que verifica quais são os adjacentes de um vertice.
function adjacentes(grafo::Grafo, vertice::Vertice)
    adjacentes = []

    for aresta in grafo.arestas
        if vertice == aresta.verticeA
            push!(adjacentes, aresta.verticeB)
        elseif vertice == aresta.verticeB
            push!(adjacentes, aresta.verticeA)
        end
    end

    return adjacentes
end

# Função que cria a lista de adjacencia.
function listaAdjacente(grafo::Grafo)
    print("Vértice")
    print("\t"^2)
    println("Lista Adjacente")

    for vertice in grafo.vertices
        print(vertice.rotulo, "\t"^2)

        S = adjacentes(grafo, vertice)
        So = sort(S, by=x -> x.rotulo)
        for (i, x) in enumerate(So)
            if i > 1
                print(", ")
            end

            print(x.rotulo)
        end

        println()
    end
end

# Função para retornar uma matriz de adjacencia.
function matrizAdjacencia(grafo::Grafo)
    tamanho = length(grafo.vertices)
    matriz = zeros(Int, tamanho, tamanho)

    for (i, v) in enumerate(grafo.vertices)
        res = adjacentes(grafo, v)
        for v2 in res
            matriz[i, v2.id] = 1
        end
    end

    return matriz
end

# Função para retornar uma matriz de incidencia.
function matrizIncidencia(grafo::Grafo)
    tamanhoV = length(grafo.vertices)
    tamanhoA = length(grafo.arestas)
    matriz = zeros(Int, tamanhoV, tamanhoA)

    for (i, a) in enumerate(grafo.arestas)
        matriz[a.verticeA.id, i] = 1
        matriz[a.verticeB.id, i] = 1
    end

    return matriz
end

# Função que mostra a ordem do grafo.
function ordemGrafo(grafo::Grafo)
    ordem = length(grafo.vertices)

    print("A ordem do grafo é ", ordem, ".")

    return ordem
end

# Função que mostra o tamanho do grafo.
function tamanhoGrafo(grafo::Grafo)
    tamanho = length(grafo.arestas)

    print("O tamanho do grafo é ", tamanho, ".")

    return tamanho
end

# Função que calcula a vizinhança.
function vizinhanca(grafo::Grafo, vertice::Vertice)
    vizinhanca = adjacentes(grafo, vertice)

    print("Vizinhança do vertice ", vertice.rotulo, ": ")

    vizinhancaSo = sort(vizinhanca, by=x -> x.rotulo)

    for (i, v) in enumerate(vizinhancaSo)
        if i > 1
            print(", ")
        end

        print(v.rotulo)
    end

    return vizinhancaSo
end

# Função para calcular a vizinhança de vários vertices.
function vizinhancas(grafo::Grafo, vertices::Vector{Vertice})
    adjacente = adjacentes(grafo, vertices[1])
    adjacente2 = Array{Vertice}(undef, 0)
    vizinhanca = Array{Vertice}(undef, 0)

    for (i, v) in enumerate(vertices)
        if i > 1
            adjacente = vizinhanca
            vizinhanca = Array{Vertice}(undef, 0)
        end

        adjacente2 = adjacentes(grafo, v)

        # A função intersect() calcula a intersecção entre 2 conjuntos ou mais, a função set() transforma um vetor em conjunto.
        vizinhanca = intersect(Set(adjacente), Set(adjacente2))
    end

    print("Vizinhança dos vertices ")

    for (i, v) in enumerate(vertices)
        if i > 1
            print(", ")
        end
        print(v.rotulo)
    end

    print(": ")

    # A função collect() transforma um conjunto em vetor.
    vizinhancaSo = sort(collect(vizinhanca), by=x -> x.rotulo)

    for (i, v) in enumerate(vizinhancaSo)
        if i > 1
            print(", ")
        end
        print(v.rotulo)
    end

    return vizinhancaSo
end

# Função que calcula o grau dos vertices.
function calcularGrauVertice(grafo::Grafo, vertice::Vertice)
    res = length(adjacentes(grafo, vertice))

    print("O grau do vertice ", vertice.rotulo, " é ", res, ".")

    return res
end

