//O Cofre Seguro
import Foundation

class Cofre{
    private var saldo: Double
    
    
    init(depositoInicial: Double){
        if depositoInicial < 0.0{
            self.saldo = 0.0
            print("ERRO: O deposito não deve ser negativo")
        }else{
            self.saldo = depositoInicial
        }
    }
    
    public func depositar(quantia: Double){
        if quantia < 0.0{
                print("ERRO: A quantia a ser depositada deve ser positiva")
        }else{
            saldo += quantia
        }
    }
    
    public func sacar(quantia: Double){
        if quantia < 0.0{
            print("ERRO: A quantia a ser sacada deve ser positiva")
        }else if quantia > saldo{
            print("ERRO: A quantia a ser sacada deve ser menor ou igual ao saldo")
        }else{
            saldo -= quantia
        }
    }
    
    public func getSaldo() -> Double{
            return saldo
    }
}

print("Criando um cofre válido:")
let meuCofre = Cofre(depositoInicial: 100.0)
print("Saldo inicial: \(meuCofre.getSaldo())") // Esperado: 100.0
print("\nTentando criar um cofre inválido:")
let cofreInvalido = Cofre(depositoInicial: -50.0) // Esperado: Mensagem de aviso
print("Saldo do cofre inválido: \(cofreInvalido.getSaldo())") // Esperado: 0.0
print("\n--- Transações ---")
meuCofre.depositar(quantia: 50.0) // Válido
print("Saldo após depósito: \(meuCofre.getSaldo())") // Esperado: 150.0
meuCofre.depositar(quantia: -20.0) // Inválido
print("Saldo após depósito falho: \(meuCofre.getSaldo())") // Esperado: 150.0
meuCofre.sacar(quantia: 30.0) // Válido
print("Saldo após saque: \(meuCofre.getSaldo())") // Esperado: 120.0
meuCofre.sacar(quantia: 200.0) // Inválido (saldo insuficiente)
print("Saldo após saque falho: \(meuCofre.getSaldo())") // Esperado: 120.0
//meuCofre.saldo = 5000.0
// Esta linha deve causar um ERRO, demonstrando que 'saldo' está seguro:
