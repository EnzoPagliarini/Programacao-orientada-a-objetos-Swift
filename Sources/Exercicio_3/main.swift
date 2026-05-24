//Atividade Aula 4


class Veiculo{
    let marca: String
    let ano: Int
    
    init(marca: String, ano: Int) {
        self.marca = marca
        self.ano = ano
    }
    
    func apresentar(){
        print("Marca: \(marca), ano: \(ano)")
    }
    
    func detalhes() -> String{
        return "Este é um veículo "
    }
}

class Carro: Veiculo{
    var numeroDePortas: Int
    
    
    init(numeroDePortas: Int, marca: String, ano: Int) {
        self.numeroDePortas = numeroDePortas
        super.init(marca: marca, ano: ano)
    }
    
    
    override func detalhes() -> String {
        return "Este é um carro de 4 rodas"
    }
}

class Moto: Veiculo{
    var cilindrada: Int
    
    init(cilindrada: Int, marca: String, ano: Int) {
        self.cilindrada = cilindrada
        super.init(marca: marca, ano: ano)
    }
    
    override func detalhes() -> String {
        return "Este é uma moto de 2 rodas"
    }
}


let meuCarro = Carro(numeroDePortas: 4, marca: "Toyota", ano: 2020)
let minhaMoto = Moto(cilindrada: 300, marca: "Honda", ano: 2022)

var veiculos: [Veiculo] = [meuCarro, minhaMoto]

for veiculo in veiculos {
    print(veiculo.detalhes())
}

//meuCarro.apresentar()


