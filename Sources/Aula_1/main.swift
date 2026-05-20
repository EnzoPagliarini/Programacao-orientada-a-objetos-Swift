struct Carro{
    var modelo: String
    var marca: String
    var proprietario: Proprietarios

    init(modelo: String, marca: String, proprietario: Proprietarios){
        self.modelo = modelo
        self.marca = marca
        self.proprietario = proprietario
    }

}



enum Proprietarios{
    case Pedro
    case Enzo
    case Juliana
}



var meuCarro = Carro(modelo: "Mustang", marca: "Ford", proprietario: .Enzo)


var carroRoubado = meuCarro

carroRoubado.marca = "Fiat"
print(meuCarro.marca)
print(carroRoubado.marca)

