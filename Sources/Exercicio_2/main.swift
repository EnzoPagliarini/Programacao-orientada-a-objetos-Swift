//SISTEMA DE LOJA VIRTUAL

import Foundation


protocol VendavelOnline{
    var preco: Double {get set}
    func adicionarAoCarrinho() -> String
}


protocol Enviavel{
    var pesoEmGramas: Int {get set}
    func calcularCustoEnvio() -> Double
}


class LivroFisico: VendavelOnline, Enviavel{
    var preco: Double
    var pesoEmGramas: Int
    let titulo, autor: String
    
    
    init(titulo: String, autor: String, preco: Double, pesoEmGramas: Int) {
        self.titulo = titulo
        self.autor = autor
        self.preco = preco
        self.pesoEmGramas = pesoEmGramas
    }
    
    func adicionarAoCarrinho() -> String{
        return "O livro \(titulo) foi adicionado ao carrinho"
    }
    
    func calcularCustoEnvio() -> Double{
        let pesoEmGramasDouble = Double(pesoEmGramas)
        return (pesoEmGramasDouble / 100.0) * 2.5
    }
    
}

struct CursoOnline: VendavelOnline{
    var preco: Double
    let nome, instrutor: String
    
    
    func adicionarAoCarrinho() -> String{
        return "Inscrição para o curso \(nome) realizada com sucesso!"
    }
}

var livro = LivroFisico(titulo: "Harry Potter", autor: "JK Rowling", preco: 50.0, pesoEmGramas: 350)
var curso = CursoOnline(preco: 599.99, nome: "POO Swift", instrutor: "Pedro")

print(livro.adicionarAoCarrinho())
print(livro.calcularCustoEnvio())
print(curso.adicionarAoCarrinho())
