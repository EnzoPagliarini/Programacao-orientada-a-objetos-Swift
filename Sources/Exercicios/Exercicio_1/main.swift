import Foundation

protocol ProtocoloRastreavel{
    func obterLocalizacao() -> String
}

class Veiculo{
    var velocidade: Double
    

    init(velocidade: Double){
        self.velocidade = velocidade
    }
    
    func acelerar(){
        velocidade += 10
    }
}

class CarroDeEntrega: Veiculo,ProtocoloRastreavel{
    let placa: String
    
    init(placa: String, velocidade: Double){
        self.placa = placa
        super.init(velocidade:  velocidade)
    }
    
    override func acelerar(){
        velocidade += 5
    }
    
    func obterLocalizacao() -> String {
        return "O Carro de entrega com placa \(placa) está aqui"
    }
    
    func getVelocidade() -> Double{
        return velocidade
    }
}


var caminhao = CarroDeEntrega(placa: "SW1FT", velocidade: 0.0)
var van = CarroDeEntrega(placa: "LO14A", velocidade: 40.0)
    
print(caminhao.obterLocalizacao())
caminhao.acelerar()
caminhao.acelerar()
caminhao.acelerar()
print("A velocidade atual é de \(caminhao.getVelocidade())")
print(van.obterLocalizacao())






