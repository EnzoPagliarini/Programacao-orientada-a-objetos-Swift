import Foundation

class Carro{
    var marca: String
    var modelo: String
    private var proprietario: Proprietarios
    var valorPatio: Int

    public init(marca : String, modelo: String, proprietario: Proprietarios){
        self.marca = marca
        self.modelo = modelo
        self.proprietario = proprietario
        valorPatio = 200
    }
    
    func carroDetails(){
        print("O carro da marca: \(marca) pertence ao proprietario: \(proprietario)")
    }

    private func setProprietario(novoP: Proprietarios){
        self.proprietario = novoP
    }

    func getProprietario() -> Proprietarios{
        return proprietario
    }

     func getValorPatio() -> Int{
        return valorPatio
    }

}

enum Proprietarios{
    case Pedro
    case Julia
    case Marina
}

class Pagamento{
    var carro: Carro
    var valorDias: Int

    init(carro: Carro, valorDias: Int){
        self.carro = carro
        self.valorDias = valorDias
    }



    func calcularPreco() -> Int{
        let valorPatio = carro1.getValorPatio()
        let total = valorPatio * valorDias
        return total
    }
}

var carro1 = Carro(marca: "Ford", modelo: "Mustang", proprietario: .Julia)
//carro1.setProprietario(novoP: .Julia)
print(carro1.getProprietario())

//print(carro1.valorPatio)

var pagamento = Pagamento(carro: carro1, valorDias: 3)

print(pagamento.calcularPreco())