import Foundation

class Pessoa{
    fileprivate var nome: String
    fileprivate var email: String
    fileprivate var telefone: String
    fileprivate var endereco: String
    fileprivate let cpf: String
    //fileprivate let dataDeNascimento: Date
    fileprivate let sexo: String
    
    init(nome: String, email: String, telefone: String, endereco: String, cpf: String, sexo: String) {
        self.nome = nome
        self.email = email
        self.telefone = telefone
        self.endereco = endereco
        self.cpf = cpf
//        self.dataDeNascimento = dataDeNascimento
        self.sexo = sexo
    }
    
    public func getDescricao() -> String{
        return "nome = \(nome)\nemail = \(email)\ntelefone = \(telefone)\ncpf = \(cpf)\nendereço = \(endereco)\nsexo = \(sexo)"
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
    private var matricula: Int
    private var nivel: NivelAluno
    private(set) var plano: String
    private var biometria: String
    private var objetivo: Objetivo
    private var peso: Float
    private var altura: Float
    
    init(plano: String, biometria: String, objetivo: Objetivo, peso: Float, altura: Float, nome: String, email: String, telefone: String, cpf: String, endereco: String, nivel: NivelAluno, sexo: String) {
        self.plano = plano
        self.biometria = biometria
        self.objetivo = objetivo
        self.peso = peso
        self.altura = altura
        self.nivel = nivel
        self.matricula = Int.random(in: 1000...4000)
        super.init(nome: nome, email: email, telefone: telefone, endereco: endereco,cpf: cpf,sexo: sexo)
    }
    
    public func trocarPlano(novoPlano: String){
        self.plano = novoPlano
    }
    
    public func pagamento() -> String{
        return "O aluno \(self.nome) realizou o pagamento com sucesso"
    }
    
    override func getDescricao() -> String{
        return super.getDescricao() + "\nplano = \(plano)\nbiometria\(biometria)\nobjetivo = \(objetivo)\npeso = \(peso)\naltura = \(altura)\nmatricula = \(matricula)"
    }
}

class Instrutor: Pessoa{
    private var especialidade: String
    private var formcacao: String
    
    
    init(especialidade: String, formcacao: String, nome: String, email: String, telefone: String, cpf: String, endereco: String, sexo: String) {
        self.especialidade = especialidade
        self.formcacao = formcacao
        super.init(nome: nome, email: email, telefone: telefone, endereco: endereco,cpf: cpf,  sexo: sexo)
    }
    
    override func getDescricao() -> String{
        return super.getDescricao() + "\nespecialidade = \(especialidade)\nformação = \(formcacao)"
    }
}


class Plano{
    public var nome: String
    
    init(nome: String){
        self.nome = nome
    }
    
    public func calcularMensalidade() -> Double {
        return 0.0
    }
}

class PlanoMensal: Plano {
    private let mensalidade: Double

    init(mensalidade: Double = 120.0) {
        self.mensalidade = mensalidade
        super.init(nome: "Plano Mensal")
    }

    override public func calcularMensalidade() -> Double {
        return mensalidade
    }

    public func getMensalidade() -> Double {
        return calcularMensalidade()
    }
}

class PlanoAnual: Plano {
    private let planoMensal: PlanoMensal

    init(planoMensal: PlanoMensal = PlanoMensal()) {
        self.planoMensal = planoMensal
        super.init(nome: "Plano Anual (Promocional)")
    }

    override public func calcularMensalidade() -> Double {
        return (planoMensal.getMensalidade() * 12) * 0.8
    }
}

var pessoa: Pessoa = Pessoa(nome: "Enzo", email: "Email@", telefone: "49928922", endereco: "Mackenzie", cpf: "44412309",  sexo: "Masculino")


var instrutor: Instrutor = Instrutor(especialidade: "Agachamento", formcacao: "Educação Física", nome: "Juliana", email: "Emzil", telefone: "123123123", cpf: "01029831", endereco: "Meu coração", sexo: "Feminino")

var aluno: Aluno = Aluno(plano: "Plano Anual", biometria: "123441", objetivo: .ganharMassa, peso: 60.5, altura: 1.70, nome: "João", email: "Email", telefone: "12778653", cpf: "41241298", endereco: "mackenzie alphaville", nivel: .iniciante, sexo: "Masculino")

print(pessoa.getDescricao())
print(instrutor.getDescricao())
print(aluno.getDescricao())
