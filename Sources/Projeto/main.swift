import Foundation

class Pessoa{
    fileprivate var nome: String
    fileprivate var email: String
    fileprivate var telefone: String
    fileprivate var endereco: String
    fileprivate let cpf: String
    //private let dataDeNascimento: String
    //private let sexo: String
    
    init(nome: String, email: String, telefone: String, cpf: String, endereco: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.cpf = cpf
        self.endereco = endereco
    }
    
    public func getDescricao() -> String{
        return "nome = \(self.nome)\nemail = \(self.email)\ntelefone = \(self.telefone)\ncpf\(self.cpf)\nendereço = \(endereco)"
    }
}

enum NivelAluno{
    case iniciante
    case intermediario
    case avancado
}

enum Objetivo{
    case perderBeso
    case ganharMassa
    case altaPerformance
    case poliesportivo
}

class Aluno: Pessoa{
    private var plano: String
    private var biometria: String
    private var objetivo: Objetivo
    private var peso: Float
    private var altura: Float
    
    init(plano: String, biometria: String, objetivo: Objetivo, peso: Float, altura: Float, nome: String, email: String, telefone: String, cpf: String, endereco: String) {
        self.plano = plano
        self.biometria = biometria
        self.objetivo = objetivo
        self.peso = peso
        self.altura = altura
        super.init(nome: nome, email: email, telefone: telefone, cpf: cpf, endereco: endereco)
    }
    
    public func trocarPlano(novoPlano: String){
        self.plano = novoPlano
    }
    
    public func pagamento() -> String{
        return "O aluno \(self.nome) realizou o pagamento com sucesso"
    }
    
    override func getDescricao() -> String{
        return "nome = \(self.nome)\nemail = \(self.email)\ntelefone = \(self.telefone)\ncpf\(self.cpf)\nendereço = \(endereco)"
    }
}

var pessoa: Pessoa = Pessoa(nome: "Enzo", email: "Email@", telefone: "49928922", cpf: "44412309", endereco: "Mackenzie")

print(pessoa.getDescricao())
